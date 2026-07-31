#!/usr/bin/env -S just --working-directory . --justfile

###################
# Global variables.
###################
#
# Which GitLab host to use when creating releases.

gitlab_host := "gitlab.archlinux.org"

# Which sources to use.

sources := "git@gitlab.archlinux.org:archlinux/packaging/upstream/shadow.git"

# Which upstream sources to use.

upstream_sources := "https://github.com/shadow-maint/shadow.git"

# Where to store the git repository of the upstream sources.

source_dir := "$HOME/.local/state/packaging/shadow"

##################
# Private recipes.
##################

# Lists all available recipes.
[private]
@default:
    just --list

# Creates a patch between the two tags `tag1` and `tag2` in a directory `dir` for the project `name`.
[private]
create-format-patch-between-tags tag1 tag2 dir name:
    printf 'Creating patch for commits between tags "%s" and "%s"...\n' "{{ tag1 }}" "{{ tag2 }}"
    just git format-patch --find-renames --no-signature --stdout "{{ tag1 }}".."{{ tag2 }}" > "{{ dir }}/{{ name }}-{{ tag2 }}.patch"

    just sign-and-compress-file "{{ dir }}/{{ name }}-{{ tag2 }}.patch"

# Creates a detached OpenPGP signature for `file` using `gpg`, then compresses it using `zstd`.
[private]
sign-and-compress-file file:
    printf 'Signing file "%s"...\n' "$(basename "{{ file }}")"
    gpg --output "{{ file }}.sig" --default-key "$(just git config --local --get user.signingkey)" --detach-sign "{{ file }}"

    printf 'Compressing file "%s"...\n' "{{ file }}"
    zstd --compress --verbose "{{ file }}" -o "{{ file }}.zst"

# Derives the project name from the directory name of the git source repository.
[private]
derive-project-name:
    basename "$(just git rev-parse --show-toplevel)"

[private]
derive-upstream-tag-from-configure:
    just ensure-command sed

    sed --regexp-extended --quiet 's|AC_INIT\(\[shadow\], \[([0-9.]+)\],.*|\1|p' {{ source_dir }}/configure.ac

# Ensures that one or more required commands are installed.
[private]
ensure-command +command:
    #!/usr/bin/env bash
    set -euo pipefail

    read -r -a commands <<< "{{ command }}"

    for cmd in "${commands[@]}"; do
        if ! command -v "$cmd" > /dev/null 2>&1 ; then
            printf "Unable to find required executable '%s'\n" "$cmd" >&2
            exit 1
        fi
    done

# Ensures that a tag does not yet exist locally.
[private]
ensure-tag-does-not-exist tag:
    #!/usr/bin/env bash
    set -euo pipefail

    readonly tag={{ tag }}

    if [[ -n "$(just git tag -l "$tag")" ]]; then
        printf 'The tag %s exists already!\n' "$tag" >&2
        exit 1
    fi

# Ensures that a tag exists locally.
[private]
ensure-tag-exists tag:
    #!/usr/bin/env bash
    set -euo pipefail

    readonly tag={{ tag }}

    if [[ -z "$(just git tag -l "$tag")" ]]; then
        printf 'The tag %s does not yet exist!\n' "$tag" >&2
        exit 1
    fi

################
# Check recipes.
################

# Checks source code formatting.
[group('check')]
check-formatting:
    just ensure-command mado
    just --fmt --check
    mado check

######################
# Development recipes.
######################

# Fetches updates for the upstream git source repository.
[group('dev')]
fetch-sources:
    just ensure-command git
    just git fetch --tags
    just git fetch upstream --tags

[group('dev')]
get-source-dir:
    printf '%s\n' "{{ source_dir }}"

# Calls git in the upstream git source repository (short for `git -C source_dir options`).
[group('dev')]
git *options:
    just ensure-command git
    git -C {{ source_dir }} {{ options }}

# Sets up the upstream git source repository to work with.
[group('dev')]
setup-sources:
    just ensure-command git
    mkdir --parents --verbose "$(basename "{{ source_dir }}")"
    git clone {{ sources }} {{ source_dir }}
    just git remote add upstream {{ upstream_sources }}
    just fetch-sources

##################
# Release recipes.
##################

# Create release for a tag with `prerelease` and upload a signed patch for all commits between the upstream tag and the targeted tag
[group('release')]
release prerelease='arch1':
    #!/usr/bin/env bash
    set -euo pipefail

    just ensure-command git glab gpg

    readonly prerelease="{{ prerelease }}"
    if [[ -z "$prerelease" ]]; then
        printf "No prerelease found!\n" >&2
        exit 1
    fi

    # The project name (according to the name of the git repository).
    project_name="$(just derive-project-name)"
    if [[ -z "$project_name" ]]; then
        printf "No project name found!\n" >&2
        exit 1
    fi
    readonly project_name="$project_name"
    printf 'Preparing release for "%s"...\n' "$project_name"

    # The upstream version (e.g. `4.19.0` or `4.19.1`).
    upstream_tag="$(just derive-upstream-tag-from-configure)"
    # The distribution tag (e.g. `4.19.0-arch1` or `4.19.1-arch1`).
    distribution_tag="$upstream_tag-$prerelease"
    printf 'Targeting distribution tag "%s" and upstream tag "%s"\n' "$distribution_tag" "$upstream_tag"

    just ensure-tag-exists "$upstream_tag"
    just ensure-tag-does-not-exist "$distribution_tag"

    printf 'Checking GitLab authentication...\n'
    glab auth status --hostname {{ gitlab_host }}

    tmpdir="$(mktemp --dry-run --directory)"
    readonly tmpdir="$tmpdir"
    mkdir --parents "$tmpdir"

    # remove temporary dir on exit
    cleanup() (
      if [[ -n "${tmpdir:-}" ]]; then
        rm --force --recursive "$tmpdir"
      fi
    )

    trap cleanup EXIT

    printf 'Creating distribution tag "%s"...\n' "$distribution_tag"
    just git tag --sign "$distribution_tag" --message "$distribution_tag"

    # Create the (zstd compressed and signed) distribution patch file.
    just create-format-patch-between-tags "$upstream_tag" "$distribution_tag" "$tmpdir" "$project_name"

    printf 'Pushing tag "%s"...\n' "$distribution_tag"
    just git push origin refs/tags/"$distribution_tag"

    printf 'Creating release for tag "%s" and uploading signed artifacts...\n' "$distribution_tag"
    GITLAB_HOST={{ gitlab_host }} glab release create "$distribution_tag" "$tmpdir/$project_name-"*.{sig,zst} --name="$distribution_tag" --notes="$distribution_tag" --repo {{ sources }}
