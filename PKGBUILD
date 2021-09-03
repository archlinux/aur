# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=zsa-wally
pkgver=2.1.3
pkgrel=1
pkgdesc="Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally"
license=("MIT")
depends=("gtk3" "webkit2gtk" "libusb")
makedepends=("go" "npm")
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver-linux.tar.gz"
)
md5sums=('cc954f216d5afd6e2665de38365ab5aa')
sha1sums=('00a4ca823dd2fbb8dfc54b494024ce4d475ea8f0')
sha512sums=('f8afbef55e108986aeb5b97e924c1b98492b4ab3bca08fe56b32a21c047a085de663b0ac86724c2104ab63bb19bfdc023f4cff29a0a5284515f0d77ec9354201')

prepare() {
    cd "wally-$pkgver-linux"

    export GOPATH="$srcdir/gopath"
    # This needs to be the same version as in mod.go from wally
    go get -modcacherw github.com/wailsapp/wails/cmd/wails@v1.16.6
}

build() {
    cd "wally-$pkgver-linux"

    export GOPATH="$srcdir/gopath"
    export PATH="$(go env GOPATH)/bin:$PATH"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    # Don't know what this does but it's in the install.linux.sh script from upstream
    export CGO_ENABLED=1

    wails build
}

package() {
    cd "wally-$pkgver-linux"
    install -Dm755 build/wally "$pkgdir/usr/bin/wally"
    install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" dist/linux64/50-oryx.rules dist/linux64/50-wally.rules
    install -Dm644 dist/linux64/wally.desktop "$pkgdir/usr/share/applications/wally.desktop"
    install -Dm644 appicon.png "$pkgdir/usr/share/pixmaps/wally.png"
    install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/license.md"
}
