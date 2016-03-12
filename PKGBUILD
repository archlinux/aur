# Maintainer: Andres Manz <manz dot andres at gmail dot com>

_pkgname=poco
pkgname=${_pkgname}-git
pkgver=1.7.0.r0.gf28591b
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, complete edition"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.pocoproject.org/"
license=('custom:boost')
depends=('libmariadbclient' 'openssl' 'unixodbc' 'expat' 'sqlite')
makedepends=('git' 'cmake' 'chrpath')
source=('git+https://github.com/pocoproject/poco.git#branch=master')
sha256sums=('SKIP')
conflicts=('poco')
provides=('poco')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^poco.//;s/.release//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DPOCO_UNBUNDLED=ON .
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="${pkgdir}" make install
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    chrpath -d "${pkgdir}/usr/bin/cpspc"
    chrpath -d "${pkgdir}/usr/bin/f2cpsp"
}
