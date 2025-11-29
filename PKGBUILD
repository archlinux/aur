# Maintainer: Wiktor Zykubek <dev at wzykubek dot xyz>
pkgname=sieveman
pkgver=0.3.1
pkgrel=2
pkgdesc="Universal ManageSieve protocol client."
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv7h' 'aarch64' 'riscv64')
license=('ISC')
url="https://github.com/wzykubek/sieveman"
depends=('glibc')
makedepends=('go>=1.23.5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wzykubek/sieveman/archive/v${pkgver}.tar.gz")
sha256sums=('b24d3c631ac32f8f81fe192e18b642105e8a219531d97193f825a8f2d42c12c7')

prepare() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    make VERSION=$pkgver
}

check() {
    cd "${pkgname}-${pkgver}"
    make test
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
