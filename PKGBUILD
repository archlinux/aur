# Maintainer: zitro <0 ät zitro fullstop id>
# Contributor: Yigit Sever <yigit at yigitsever dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Clayton Craft <clayton@craftyguy.net>


# Environment used for packaging source overrides ::
#
# - REPO_COORDS__PY_SPY_GIT: `${'branch' | 'tag' | 'commit'}=${any}${string}` -- for the branch/tag/commit git coordinate
# - REPO_USE_SSH__PY_SPY_GIT: boolean -- for using SSH to retrieve the source
# - REPO_LOCAL__PY_SPY_GIT: UnixPath -- for overriding to a local git checkout

# To build from a local checkout instead of the remote master -- e.g. to test
#   changes you have committed locally -- do NOT edit this source= line.
# Point the build at your clone with the REPO_LOCAL__PY_SPY_GIT environment variable,
#   which may be any path inside the repo (a file is reduced to its `dirname`, and
#   `git rev-parse --show-toplevel` normalises it to the repo root), e.g. ::
#
#   > env REPO_LOCAL__PY_SPY_GIT="$(pwd)" makepkg -fis
#
# The commit-ish built is governed by `_repo_git_coords` at the top of this
#   file (default `branch=master`; a local build re-pins it to a concrete SHA);
#   REPO_USE_SSH__PY_SPY_GIT=1 selects the SSH remote when no local path is given.

#region Config
#region Config::Packaging
_pkgbase_stem=$'py-spy'
_pkgname_stems=("${_pkgbase_stem}")
_pkgdesc=$'Sampling profiler for Python programs'
#epoch=0
pkgrel=1
_homepage_url=$'https://github.com/benfred/py-spy'
_global_conflicts=()

#region Config::Packaging::Technical
_pkgname_prefix=$''
_pkgname_suffix=$'-git'
_pkgdesc_prefix=$''
_pkgdesc_suffix=$' (git version)'

_other_known_providers=(
  $'py-spy-bin'
  $'py-spy'
)
#endregion Config::Packaging::Technical
#endregion Config::Packaging

#region Config::Source
_repo_uri=$'github.com/benfred/py-spy'
_repo_git_coords=$'branch=master'
# `branch=<branch_name>` (not `commit=<branch_name>`) for a moving tip: makepkg resolves `branch=`
#   to `origin/<x>`, which `git fetch` keeps fresh, whereas `commit=<branch>` resolves a bare name
#   that a reused working copy leaves stale.
# A local build (`$REPO_LOCAL`) re-pins this to a concrete SHA below.

license=('MIT')
validpgpkeys=($'968479A1AFF927E37D1A566BB5690EEEBB952194')
arch=('x86_64')

#region Config::Source::Deps
depends=()
makedepends=('rust' 'cargo' 'libunwind')
checkdepends=()
#endregion Config::Source::Deps
#endregion Config::Source
#endregion Config


# ------------------------------------------------------------------------------


#region Derivations

# Map :: _pkgnames_with_prefix_and_suffix := forall _pkgname_stem in _pkgname_stems.
#          "${_pkgname_prefix}${_pkgname_stem}${_pkgname_suffix}"
_pkgnames_with_suffix=("${_pkgname_stems[@]/%/"${_pkgname_suffix}"}")
_pkgnames_with_prefix_and_suffix=("${_pkgnames_with_suffix[@]/#/"${_pkgname_prefix}"}")

# All other providers suffixed with `-debug`, so that machines with options=($'debug')
#   will receive a prompt to replace that as well
_debugsyms_conflicts=("${_other_known_providers[@]/%/$'-debug'}")

#region Derivations::Packaging
pkgbase="${_pkgname_prefix}${_pkgbase_stem}${_pkgname_suffix}"
pkgname=("${_pkgnames_with_prefix_and_suffix[@]}")
# derived by `updpkgsums`
pkgver=0.4.2.r18.g2106813
pkgdesc="${_pkgdesc_prefix}${_pkgdesc}${_pkgdesc_suffix}"
url="${_homepage_url}"

conflicts=("${_global_conflicts[@]}")
#endregion Derivations::Packaging

#region Derivations::GitCoords
# Ordering: config -> ssh override -> local checkout override (last set wins)

_pkg_cfg_key="$(printf '%s' "${pkgbase@U}" | LC_ALL=C tr -c 'A-Z0-9' '_')"
# Remap the per-package envs to locally-NSd names
declare -n REPO_COORDS="REPO_COORDS__${_pkg_cfg_key}"
declare -n REPO_USE_SSH="REPO_USE_SSH__${_pkg_cfg_key}"
declare -n REPO_LOCAL="REPO_LOCAL__${_pkg_cfg_key}"

if ((REPO_PACKAGING_DEBUG)); then
  msg2 'REPO_COORDS = %s\n' "${REPO_COORDS}" >&2;
  msg2 'REPO_USE_SSH = %s\n' "${REPO_USE_SSH}" >&2;
  msg2 'REPO_LOCAL = %s\n' "${REPO_LOCAL}" >&2;
fi

_repo_git_coords="${REPO_COORDS:-"${_repo_git_coords}"}"
_repo_git_url="https://${_repo_uri}.git"  # Anonymous machine-ready access

if ((REPO_USE_SSH)); then
  _repo_git_url="ssh://git@${_repo_uri}.git"  # If you have SSH configured for the forge
fi

_repo_git_path=""
if [[ -n "${REPO_LOCAL:-}" && (-d "${REPO_LOCAL}" || -f "${REPO_LOCAL}") ]]; then
  _repo_param="${REPO_LOCAL}"
  if [[ -f "${REPO_LOCAL}" ]]; then
    _repo_param="$(dirname -- "${REPO_LOCAL}")"
  fi
  _repo_git_path="$(git -C "${_repo_param}" rev-parse --show-toplevel)"
  _repo_git_url="file://${_repo_git_path}"  # Local checkout

  # Pin the coords to a concrete commit resolved in the local repo. makepkg reuses its git
  #   working copy across builds and `git fetch` only advances origin/*, so a `commit=<branch>`
  #   fragment resolves the STALE same-named local branch there (makepkg's git.sh does
  #   `ref=${fragment##*=}` for commit=, a bare name -- observed building the previous tag).
  # A full SHA is not a branch name, so makepkg checks out exactly that object once fetched;
  #   the `#*=` strip makes this uniform whether the coords say commit=/branch=/tag=/HEAD.
  _sha="$(git -C "${_repo_git_path}" rev-parse --verify --quiet "${_repo_git_coords#*=}^{commit}")" \
    && _repo_git_coords="commit=${_sha}"
fi
#endregion Derivations::GitCoords

#region Derivations::Source
source=("${pkgbase}::git+${_repo_git_url}#${_repo_git_coords}?signed"
       )
sha256sums=('SKIP')

if ((REPO_PACKAGING_DEBUG)); then
  msg2 'source[%s] = %s\n' "${source[@]@k}" >&2;
fi
#endregion Derivations::Source
#endregion Derivations

pkgver() {
  cd "${pkgbase}" || return 1;
  git describe --long --tags | sed -r 's/^v([0-9]+(\.[0-9]+)*)-([0-9]+)-/\1.r\3./';
}

prepare() {
  cd "${pkgbase}" || return 1;
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgbase}" || return 1;
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package_py-spy-git() {
  #region Derivations::Packaging::Replacing
  _index=0
  _pkgname_stem="${_pkgname_stems[${_index}]}"

  # makepkg doesn't eval the whole `package_` fn, it only evaluates the toplevel
  #   and greps the provides/conflicts LINES.
  # Hence we inline here. Ugly.
  provides=("${_pkgname_stems[0]}=${epoch:+"${epoch}:"}${pkgver}-${pkgrel}")
  conflicts=("${_pkgname_stems[0]}" "${_debugsyms_conflicts[@]}")
  #endregion Derivations::Packaging::Replacing

  cd "${pkgbase}" || return 1;
  install -Dm0755 "target/release/py-spy" "${pkgdir}/usr/bin/py-spy"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname_stem}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname_stem}/README.md"
}
