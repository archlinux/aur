# Maintainer: kallisti5 <alex at terarocket dot io>
pkgname=go-foks
pkgver=0.1.4
pkgrel=1
pkgdesc="CLI for Federated Open Key Service"
arch=(x86_64 armv7h aarch64)
url="https://foks.pub"
license=(MIT)
depends=(pcsclite glibc)
makedepends=(go)
options=('!lto')

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/foks-proj/${pkgname}/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('36f7518603a6eff99ee277798242d4d513be47928c2734c94350202c8a2dbeb1')

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
