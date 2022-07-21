# Maintainer: Nathanael Demacon <nathanael.dmc[at]outlook[dot]fr>

pkgname=sshs
pkgver="3.3.0"
pkgrel="1"
pkgdesc="Terminal user interface for SSH"
arch=('any')
url="https://github.com/quantumsheep/sshs"
license=('MIT')
depends=('openssh')
makedepends=('go')
source=("https://github.com/quantumsheep/sshs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('07992229eab5d97be4fac44a21d3ad3c89ef7c7d15c8814ed579a054334f5e5f')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i "s|go build |go build -trimpath -mod=readonly -modcacherw -buildmode=pie |" Makefile
}

build() {
    export GOPATH="$srcdir"/gopath
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$pkgname-$pkgver"
    make VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
