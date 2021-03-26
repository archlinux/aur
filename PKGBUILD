# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=zsa-wally
pkgver=2.1.0
pkgrel=12
pkgdesc="Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally"
license=("MIT")
depends=("gtk3" "webkit2gtk" "libusb")
makedepends=("go" "npm")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/zsa/wally/archive/refs/tags/$pkgver-linux.tar.gz"
    "modernize-udev-rules.patch"
    "desktop-file.patch"
)
md5sums=('f4a98a0e51d5d0b6d23a95858d230e11'
         'd444c2b74b3c51c265f91020942075bc'
         'e1800d7066a392864619db15145fe735')
sha1sums=('deb20d7c9b1a1eb799bb2288540fb7119f1f8ba2'
          '62c1903d3723399d209f0642849d850e91feaef8'
          '3e1bd7e97924712381860ae3264b6600f5e9c23c')
sha512sums=('d84c469f7d43ba86eb5d0d527a17b588ea12e0272897231392e0572cef0a80f806948a225e263806e5cf7b2fc95eb58e02468ecbe8d12f69ec07919eb364e789'
            '923cd4c9795f9828a827e8f5d832ee6f0b74aeb19d948f4e9d8eb7b59d93a570a4bd5e0e0e0b24adfa78644df60425063b37f19ae658e1a3c6200a6c9c126793'
            '1f967e5ec80760b9a0cf0345d5227caf679398b3b78e0f05ddd5a5c1909039c15a8547aee9174e76beac84395a2b63b31c74396a66bce2193517f494b92216b4')

prepare() {
    cd "wally-$pkgver-linux"

    patch --strip=1 --input="$srcdir/modernize-udev-rules.patch"
    patch --strip=1 --input="$srcdir/desktop-file.patch"

    export GOPATH="$srcdir/gopath"
    go get -u github.com/wailsapp/wails/cmd/wails
}

build() {
    cd "wally-$pkgver-linux"

    export GOPATH="$srcdir/gopath"
    export PATH="$(go env GOPATH)/bin:$PATH"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
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
    # This file is only on master; meanwhile use the license from the Debian package copyright file
    install -Dm644 dist/ppa/wally/template/debian/copyright "$pkgdir/usr/share/licenses/$pkgname/copyright"
    #install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/license.md"
}
