# Maintainer: kallisti5 <alex at terarocket dot io>
pkgname=go-foks
pkgver=0.1.5
pkgrel=1
pkgdesc="CLI for Federated Open Key Service"
arch=(x86_64 armv7h aarch64)
url="https://foks.pub"
license=(MIT)
depends=(pcsclite ccid libfido2-full glibc)
makedepends=(go)
options=('!lto')

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/foks-proj/${pkgname}/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6ef21b2cfd1b6c08846d89d51c9f590cb99a4f29f57d8793db1635a505e232f3')

prepare() {
    cd $pkgname-$pkgver
    rm -rf build && mkdir -p build
}

build() {
    cd $pkgname-$pkgver
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1
    export GOFLAGS="-trimpath"
    go build -o build/foks ./client/foks
}

package() {
    cd $pkgname-$pkgver
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -D -m755 build/foks  "$pkgdir"/usr/bin/foks
    ln -s /usr/bin/foks "$pkgdir"/usr/bin/git-remote-foks
}

# vim: ts=2 sw=2 et:
