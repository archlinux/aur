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
pkgver=0.10.0_dev.3659+e5e6eb983
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
    echo "WARNING: No way to GPG/SHA verify the version ahead of time" >&2
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

check() {
    hello_file="$(realpath ../hello.zig)"
    cd "${srcdir}/zig-linux-${CARCH}-${pkgver//_/-}";
    echo "Running Zig Hello World"
    ./zig run "$hello_file"
    ./zig test "$hello_file"
}

package() {
  cd "${srcdir}/zig-linux-${CARCH}-${pkgver//_/-}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/zig"
  cp -R lib "${pkgdir}/usr/lib/zig/lib"
  install -D -m755 zig "${pkgdir}/usr/lib/zig/zig"
  ln -s /usr/lib/zig/zig "${pkgdir}/usr/bin/zig"
  install -D -m644 docs/langref.html "${pkgdir}/usr/share/doc/zig/langref.html"
  cp -R docs/std "${pkgdir}/usr/share/doc/zig/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/zig/LICENSE"
}
