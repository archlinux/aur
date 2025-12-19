# Maintainer: Wiktor Zykubek <dev at wzykubek dot xyz>
pkgname=sieveman
pkgver=0.3.1
pkgrel=3
pkgdesc="Universal ManageSieve protocol client."
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv7h' 'aarch64' 'riscv64')
license=('ISC')
url="https://codeberg.org/wzykubek/sieveman"
depends=('glibc')
makedepends=('go>=1.23.5')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/wzykubek/sieveman/archive/v${pkgver}.tar.gz")
sha256sums=('0e5719d80168a3f4747d1473d189d106ae93c64c403f6d64026bfa60c9c971fa')

prepare() {
    cd "${pkgname}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    make VERSION=$pkgver
}

check() {
    cd "${pkgname}"
    make test
}

package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
