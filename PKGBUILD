# Maintainer: James David Clarke <james@jamesdavidclarke.com>

pkgname=zig-nightly-bin
pkgver=0.14.0_dev.184.gbf588f67d
pkgrel=1
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software (nightly build)"
arch=('x86_64' 'aarch64')
url="https://ziglang.org/"
license=('MIT')
provides=('zig')
conflicts=('zig')
depends=(jq)
optdepends=('curl: for downloading the latest version'
            'wget: alternative for downloading the latest version')
options=('!strip')

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
    _sanitize_version "$(_get_latest_version)"
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
    cd "$srcdir/zig-linux-$CARCH-$(_get_latest_version)"

    install -dm755 "$pkgdir/usr/lib/zig"
    cp -a * "$pkgdir/usr/lib/zig/"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/lib/zig/zig "$pkgdir/usr/bin/zig"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    if [ -f "doc/langref.html" ]; then
        install -Dm644 doc/langref.html "$pkgdir/usr/share/doc/zig/langref.html"
    fi
}
