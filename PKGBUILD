# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=zsa-wally
pkgver=2.1.2
pkgrel=1
pkgdesc="Flash your ZSA Keyboard the EZ way."
arch=('i686' 'x86_64')
url="https://github.com/zsa/wally"
license=("MIT")
depends=("gtk3" "webkit2gtk" "libusb")
makedepends=("go" "npm")
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver-linux.tar.gz"
    "modernize-udev-rules.patch"
    "desktop-file.patch"
)
md5sums=('2a0ab169ee3ba27509c1ebc7e477f8a3'
         '08e3b0ae2f4fef743f7b7304fcc20ebd'
         'e1800d7066a392864619db15145fe735')
sha1sums=('32d1a33f45ba8dcba767184674a971a8824eef60'
          'c2a11854e3d34d676c3ac6859a35e950bfc6b5a2'
          '3e1bd7e97924712381860ae3264b6600f5e9c23c')
sha512sums=('50a5ed4f4ef87fd776089fc352ecf7c2e83c20aec5ae21444122ed8314b0a9219120c63402b2a686c023fbddd1ea2fcb43058c5b64d2a0b2ac73a065d8a6337f'
            '5c1015f5e480241e71a2dffd3c5d92d2934e7b8ec2fe5b50e0bbe3e94c049bbc67d5cdadb1941de4a99e0033c9ee568141f368ca52d4ab2913afb7bfa67f6141'
            '1f967e5ec80760b9a0cf0345d5227caf679398b3b78e0f05ddd5a5c1909039c15a8547aee9174e76beac84395a2b63b31c74396a66bce2193517f494b92216b4')

prepare() {
    cd "wally-$pkgver-linux"

    patch --strip=1 --input="$srcdir/modernize-udev-rules.patch"
    patch --strip=1 --input="$srcdir/desktop-file.patch"

    export GOPATH="$srcdir/gopath"
    # This needs to be the same version as in mod.go from wally
    go get -modcacherw github.com/wailsapp/wails/cmd/wails@v1.16.2
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
