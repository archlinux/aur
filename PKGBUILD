# Maintainer: Jorge Pizarro-Callejas (jorgicio) <jpizarrocallejas@gmail.com>
pkgname=dnslookup
pkgver=1.9.0
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=('any')
url="https://github.com/ameshkov/dnslookup"
license=('GPL3')
depends=()
makedepends=('go>=1.19' 'patch')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ameshkov/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('577d426b6888fca698529d0fe2cce83fac983e7e4fa9785bcfb5e39e07488493')
conflicts=('dnslookup-git' 'dnslookup-bin')

prepare() {
    cd ${srcdir}/$pkgname-$pkgver
    patch -p1 < ${srcdir}/../$pkgname.patch
}

build(){
    cd "${srcdir}/$pkgname-$pkgver"
    mkdir -p "${srcdir}/gopath"
    export GOPATH="${srcdir}/gopath"
    export GOFLAGS="-modcacherw"
    go install -x -v -buildmode=pie -ldflags "-s -w" -trimpath
}

package(){
    mkdir -p $pkgdir/usr/bin
    install $srcdir/gopath/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
