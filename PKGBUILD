# Maintainer: Techcable <$USER @ techcable.net>
# Maintainer: junckes <me@junckes.dev>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=zig-dev-bin
# Old versions of zig-dev-bin used date as pkgver (pkgver=20220712)
#
# Now we use something consistent with zig internal versioning.
# Without changing the epoch, the old version scheme would be considered
# "newer" greater than the new version scheme
epoch=1
# NOTE: Sanitize version '-' -> '_', '+' -> `.g`
pkgver=0.15.0_dev.643.gdc6ffc28b
pkgrel=2
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=('x86_64' 'aarch64')
url="https://ziglang.org/"
license=('MIT')
makedepends=(curl python3 minisign)
options=('!strip' '!debug')
provides=('zig')
conflicts=('zig')
# NOTE: We don't include the "real" source until build()
#
# The exception is our test file and helper script
source=(
    "hello.zig"
    "buildhelper.py"
)
# Hardcoded sha256 not possible because this is a an auto-updating (nightly) package
#
# Zig currently uses minisign to sign the binaries, which pacman doesn't support
# See zig issue for signed binaries: https://github.com/ziglang/zig/issues/4945
sha256sums=(
    "SKIP"
    "SKIP"
)

# https://ziglang.org/download/
ZIG_MINISIGN_KEY="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U";

should_color() {
    # https://bixense.com/clicolors/
    [[ ( ! -v NO_COLOR ) && ( ( -t 2 ) || ( -v CLICOLOR_FORCE ) ) ]];
}

# Prints a warning message to stderr ('warning' conflicts with makepkg)
warn() {
    if should_color; then
        echo -en "\e[33;1mWARNING\e[0m: " >&2;
    else
        echo -n "WARNING: " >&2;
    fi;
    echo "$@" >&2;
}
# Prints an error message to stderr ('error' conflicts with makepkg)
err() {
    if should_color; then 
        echo -en "\e[31;1mERROR\e[0m: " >&2;
    else
        echo -n "ERROR: " >&2;
    fi;
    echo "$@" >&2;
}

# NOTE: If we put version-index in `source` then it would be cached
#
# This will always refresh the index, unless --holdver is specified
fetch_version_index() {
    local index_file="${srcdir}/zig-version-index.json";
    if [[ -f "$index_file" ]] && (( HOLDVER ));  then
        echo "$index_file";
        return 0;
    fi
    # Fallthrough to download index file
    echo "Downloading version index..." >&2;
    if ! curl -sS "https://ziglang.org/download/index.json" -o "$index_file"; then
        err "Failed to download version index";
        exit 1;
    else
        echo "Successfully downloaded version index (date: $(buildhelper print-date))" >&2;
    fi
    echo "$index_file"
}

buildhelper() {
    local index_file="${srcdir}/zig-version-index.json";
    python3 "${srcdir}/buildhelper.py" --index "$index_file" --target-arch "$CARCH" "$@"
}

# The original version of the zig package, without any sanitation
original_pkgver() {
    buildhelper print-version
}

# Sanitizes the package version, replacing special characters
#
# Specifically, we replace '-' with '_' because it's special-cased by makepkg & pacman,
# and replace '+$commit" with '.g$commit' because '+' is special-cased in URLs.
# Also the second form '.g$commit" is more consistent with the VCS package guidelines
# https://wiki.archlinux.org/title/VCS_package_guidelines#The_pkgver()_function
#
# Unlike VCS packages, there aren't really any clear guidelines on versioning
# for auto-updating binaries,
# so the versioning format of the package has changed somewhat over time.
pkgver() {
    buildhelper print-version --sanitize
}

prepare() {
    local index_file="$(fetch_version_index)";
    local newver="$(pkgver)";
    pushd "${srcdir}" > /dev/null;
    local newurl="$(buildhelper print-url)";
    local newurl_sig="$newurl.minisig";
    local newfile="zig-${CARCH}-${newver}.tar.xz";
    local newfile_sig="$newfile.minisig";
    # NOTE: The Arch Build System unfortunately doesn't handle dynamically added sources.
    # source+=("${newfile}:${newurl}" "${newfile_sig}:${newurl_sig}")
    local expected_hash="$(buildhelper print-hash)"
    # sha256sums+=("$expected_hash" "SKIP")
    if [[ -f "$newfile" && -f "$newfile_sig" ]]; then
        echo "Reusing existing $newfile (and signature)";
    else
        echo "Downloading Zig $newver from $newurl";
        curl -Ss "$newurl" -o "$newfile";
        echo "Downloading signature...";
        curl -Ss "$newurl_sig" -o "$newfile_sig";
    fi;
    echo "" >&2;
    local actual_hash="$(sha256sum "$newfile" | grep -oE '^\w+')"
    if [[ "$expected_hash" != "$actual_hash" ]]; then
        err "Expected hash $expected_hash for $newfile, but got $actual_hash" >&2;
        exit 1;
    fi;
    echo "Using minisign to check signature";
    if ! minisign -V -P "$ZIG_MINISIGN_KEY" -m "$newfile" -x "$newfile_sig"; then
        err "Failed to check signature for $newfile" >&2;
        exit 1;
    fi
    echo "Extracting file";
    tar -xf "$newfile";
    popd > /dev/null;
}

RELATIVE_LANGREF_FILE="doc/langref.html";
# All of these must be present for 
RELATIVE_STDLIB_DOC_FILES=("lib/docs/index.html");
check() {
    hello_file="${srcdir}/hello.zig"
    # Zig caches (both local and global) can use up a lot of space.
    # For these hello world examples (in a frequently updated package), this is very wasteful.
    #
    # Right now there is no way to disable the cache (see Zig issue #12317)
    # Instead we shove everything in a local directory and delete it
    cache_dir="${srcdir}/zig-cache"
    cd "${srcdir}/zig-${CARCH}-linux-$(original_pkgver)"
    echo "Running Zig Hello World"
    ./zig run --cache-dir "$cache_dir" --global-cache-dir "$cache_dir" "$hello_file"
    ./zig test --cache-dir "$cache_dir" --global-cache-dir "$cache_dir" "$hello_file"
    rm -rf "$cache_dir"
    rm -rf "$cache_dir";
    local missing_docs=();
    # Zig has had long-running issues with the location
    # of the docs directory.
    # See issue https://github.com/ziglang/zig/issues/9158
    #
    # We check that it's present, and warn otherwise
    # Alternative is failing the whole build just over docs
    if [[ ! -f "$RELATIVE_LANGREF_FILE" ]]; then
        missing_docs+=("langref.html");
    fi
    for stdlib_file in "${RELATIVE_STDLIB_DOC_FILES[@]}"; do
        if [[ ! -f "$stdlib_file" ]]; then
            missing_docs+=("stdlib[$(basename "$stdlib_file")]");
            break;
        fi
    done;
    if [[ "${#missing_docs[@]}" -ne 0 ]]; then
        warn "Missing documentation:" "${missing_docs[@]}";
        echo "In the past, this was related to Zig issue #9158: https://github.com/ziglang/zig/issues/9158" >&2;
        echo "" >&2;
        echo "This will not impact execution, and you can always use the website docs: https://ziglang.org/documentation/master/" >&2;
    fi
}

package() {
  cd "${srcdir}/zig-${CARCH}-linux-$(original_pkgver)"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/zig"
  cp -R lib "${pkgdir}/usr/lib/zig/lib"
  install -D -m755 zig "${pkgdir}/usr/lib/zig/zig"
  ln -s /usr/lib/zig/zig "${pkgdir}/usr/bin/zig"
  # Already gave warnings above, just silently ignore here
  if [[ -f "doc/langref.html" ]]; then
    # The official arch zig package doesn't include langref.html
    install -D -m644 doc/langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
  fi;
  if [[ -d "lib/docs" ]]; then
    # NOTE: This is consistent with where the official arch zig package places stdlib docs
    cp -R lib/docs "${pkgdir}/usr/lib/zig";
  fi
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
