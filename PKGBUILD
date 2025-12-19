# Maintainer: Wiktor Zykubek <dev at wzykubek dot xyz>
pkgname=licensmith
pkgver=1.2.0
pkgrel=2
pkgdesc="Crafting the ideal license for your Git repository in seconds!"
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv7h' 'aarch64' 'riscv64')
url="https://codeberg.org/wzykubek/licensmith"
license=('ISC')
depends=('glibc')
makedepends=('go>=1.23.4')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/wzykubek/licensmith/archive/v${pkgver}.tar.gz")
sha256sums=('95dae3a72ab83684ec137fdc59ba22f91616f4871300e1bf47513b646e1bda94')

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
