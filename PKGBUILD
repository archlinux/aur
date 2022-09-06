# Maintainer: Techcable <$USER @ techcable.net>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=zig-dev-bin
# Old versions of zig-dev-bin used date as pkgver (pkgver=20220712)
#
# Now we use something consistent with zig internal versioning.
# Without changing the epoch, the old version scheme would be considered
# "newer" greater than the new version scheme
epoch=1
# NOTE: Hyphen -> underscore
pkgver=0.10.0_dev.3880+e2bb92b2e
pkgrel=1
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=('x86_64' 'aarch64')
url="https://ziglang.org/"
license=('MIT')
makedepends=(curl jq)
options=('!strip')
provides=('zig')
conflicts=('zig')
# NOTE: We don't include the "real" source until build()
source=()
# GPG verification is not currently possible because Zig binaries aren't signed
# Hardcoded sha256 not possible because this is a an auto-updating (nightly) package
#
# Zig Issue for signed binaries: https://github.com/ziglang/zig/issues/4945
sha256sums=()

# Prints a warning message to stderr
warning() {
    echo -en "\e[33;1mWARNING\e[0m: ";
    echo "$@";
}

pkgver() {
    local index_file="${srcdir}/zig-version-index.json";
    # Invalidate old verison-index.json
    #
    # If we put version-index in `source` then it would be cached...
    if [[ -x "$index_file" ]]; then
        rm "$index_file";
    fi
    curl -sS "https://ziglang.org/download/index.json" -o "$index_file"
    jq -r .master.version "$index_file" | sed 's/-/_/'
}

prepare() {
    local newver="$(pkgver)";
    pushd "${srcdir}" > /dev/null;
    local index_file="zig-version-index.json";
    local newurl="$(jq -r ".master.\"${CARCH}-linux\".tarball" $index_file)";
    local newfile="zig-linux-${CARCH}-${newver}.tar.xz";
    source+=("${newfile}:${newurl}")
    local expected_hash="$(jq -r ".master.\"${CARCH}-linux\".shasum" "$index_file")"
    sha256sums+=("$newhash")
    if [[ -f "$newfile" ]]; then
        echo "Reusing existing $newfile";
    else
        echo "Downloading Zig $newver from $newurl" >&2;
        curl -Ss "$newurl" -o "$newfile";
    fi;
    echo "" >&2
    warning "No way to GPG/SHA verify the version ahead of time";
    echo "See Zig issue https://github.com/ziglang/zig/issues/4945 for signed binaries" >&2;
    echo "" >&2;
    local actual_hash="$(sha256sum "$newfile" | grep -oE '^\w+')"
    if [[ "$expected_hash" != "$actual_hash" ]]; then
        echo "ERROR: Expected hash $expected_hash for $newfile, but got $actual_hash" >&2;
        exit 1;
    fi;
    echo "Extracting file";
    tar -xf "$newfile";
    popd > /dev/null;
}

RELATIVE_LANGREF_FILE="docs/langref.html";
# All of these must be present for 
RELATIVE_STDLIB_DOC_FILES=("docs/std/index.html" "docs/std/main.js" "docs/std/data.js");
check() {
    hello_file="$(realpath ../hello.zig)"
    # Zig caches (both local and global) can use up a lot of space.
    # For these hello world examples (in a frequently updated package), this is very wasteful.
    #
    # Right now there is no way to disable the cache (see Zig issue #12317)
    # Instead we shove everything in a local directory and delete it
    cache_dir="${srcdir}/zig-cache"
    cd "${srcdir}/zig-linux-${CARCH}-${pkgver//_/-}";
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
            missing_docs+=("stdlib["$(basename $stdlib_file)"]");
            break;
        fi
    done;
    if [[ "${#missing_docs[@]}" -ne 0 ]]; then
        warning "Missing documentation:" "${missing_docs[@]}";
        echo "This is likely related to Zig issue #9158: https://github.com/ziglang/zig/issues/9158" >&2;
        echo "Essentially, the docs locations are inconsistent across platofrms and builds." >&2;
        echo "This is especially true on non-linux platforms (and non x86_64)" >&2;
        echo "" >&2;
        echo "This will not impact execution, and you can always use the website docs: https://ziglang.org/documentation/master/" >&2;
    fi
}

package() {
  cd "${srcdir}/zig-linux-${CARCH}-${pkgver//_/-}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/zig"
  cp -R lib "${pkgdir}/usr/lib/zig/lib"
  install -D -m755 zig "${pkgdir}/usr/lib/zig/zig"
  ln -s /usr/lib/zig/zig "${pkgdir}/usr/bin/zig"
  # Already gave warnings above, just silently ignore here
  if [[ -f "docs/langref.html" ]]; then
    install -D -m644 docs/langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
  fi;
  if [[ -d "docs/std" ]]; then
    cp -R docs/std "${pkgdir}/usr/share/doc/zig/";
  fi
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
