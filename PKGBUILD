# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=zsa-wally-cli
pkgver=2.0.1
pkgrel=2
pkgdesc="Wally: Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally-cli"
license=('MIT')
depends=('libusb')
makedepends=('go')
conflicts=('zsa-wally-cli-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver-linux.tar.gz"
    '50-wally-cli.rules'
)
sha256sums=('071b1bd10e9160c441e833be3bea211ccf835c4f1792b0c6c7fc86f7aa0695d1'
            'fb0486730617d8ef8524229fda63d256a61097ab2503e865edf5c7116d57df7d')

build() {
    cd "wally-cli-$pkgver-linux"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    go build
}

package() {
    install -Dm755 "$srcdir/wally-cli-$pkgver-linux/wally-cli" "$pkgdir/usr/bin/wally-cli"
    install -Dm644 "$srcdir/wally-cli-$pkgver-linux/license.md" "$pkgdir/usr/share/licenses/$pkgname/license.md"

    install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" "$srcdir/50-wally-cli.rules"
}
