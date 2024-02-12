# Maintainer: Jorge Pizarro-Callejas (jorgicio) <jpizarrocallejas@gmail.com>
pkgname=dnslookup
pkgver=1.7.3
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=('any')
url="https://github.com/ameshkov/dnslookup"
license=('GPL3')
depends=()
makedepends=('go>=1.19' 'patch')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ameshkov/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c63d2dc8c357045e28f29ec716e3c20e39a2c1be4dc4313c6c2ab62838e5e2db')
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
