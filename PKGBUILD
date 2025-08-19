# Maintainer: James David Clarke <james@jamesdavidclarke.com>

pkgname=zig-nightly-bin
pkgver=0.15.0_dev.1599.gcf90a5e45
pkgrel=1
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software (nightly build)"
arch=('x86_64' 'aarch64')
url="https://ziglang.org/"
license=('MIT')
provides=('zig' 'zig-nightly-bin')
conflicts=('zig')
makedepends=(jq)
optdepends=('curl: for downloading the latest version'
            'wget: alternative for downloading the latest version')
options=('!strip')

# TODO: Add fallback server for binaries in case ziglang.org is down, Source Code: `https://github.com/ziglang/www.ziglang.org/tree/main/.github/workflows`

_get_latest_version() {
    local index_url="https://ziglang.org/download/index.json"
    if command -v curl &> /dev/null; then
        curl -s "$index_url" | jq -r '.master.version'
    elif command -v wget &> /dev/null; then
        wget -qO- "$index_url" | jq -r '.master.version'
    else
        echo "Error: Neither curl nor wget is installed." >&2
        exit 1
    fi
}

_sanitize_version() {
    echo "$1" | sed 's/-/_/g; s/+/.g/g'
}

pkgver() {
    echo $(_sanitize_version "$(_get_latest_version)")
}

_get_download_url() {
    local index_url="https://ziglang.org/download/index.json"
    if command -v curl &> /dev/null; then
        curl -s "$index_url" | jq -r ".master.\"${CARCH}-linux\".tarball"
    elif command -v wget &> /dev/null; then
        wget -qO- "$index_url" | jq -r ".master.\"${CARCH}-linux\".tarball"
    else
        echo "Error: Neither curl nor wget is installed." >&2
        exit 1
    fi
}

_get_sha256sum() {
    local index_url="https://ziglang.org/download/index.json"
    if command -v curl &> /dev/null; then
        curl -s "$index_url" | jq -r ".master.\"${CARCH}-linux\".shasum"
    elif command -v wget &> /dev/null; then
        wget -qO- "$index_url" | jq -r ".master.\"${CARCH}-linux\".shasum"
    else
        echo "Error: Neither curl nor wget is installed." >&2
        exit 1
    fi
}

source=("zig-$pkgver-$CARCH-linux.tar.xz::$(_get_download_url)")
sha256sums=("$(_get_sha256sum)")

package() {
    local latest_version=$(_get_latest_version)
    local srcdir1="$srcdir/zig-$CARCH-linux-$latest_version"
    local srcdir2="$srcdir/zig-$CARCH-linux-$pkgver"
  if [ -d "$srcdir1" ]; then
        cd "$srcdir1"
    elif [ -d "$srcdir2" ]; then
        cd "$srcdir2"
    else
        echo "Error: Neither source directory found ($srcdir1 or $srcdir2)" >&2
        exit 1
    fi


    install -dm755 "$pkgdir/usr/lib/zig"
    cp -a * "$pkgdir/usr/lib/zig/"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/lib/zig/zig "$pkgdir/usr/bin/zig"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    if [ -f "doc/langref.html" ]; then
        install -Dm644 doc/langref.html "$pkgdir/usr/share/doc/zig/langref.html"
    fi
}
