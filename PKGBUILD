#
# Maintainer: Rosetta Roberts <rosettafroberts at gmail>
# 

pkgname=idris2-api-git
pkgver=0.4.0.r304.g1e002772
pkgrel=1
pkgdesc="API for Developing Support Tools for Idris 2"
url="https://www.idris-lang.org/"
license=('custom')
arch=('any')
depends=('idris2')
makedepends=('git')
provides=('idris2-api')
conflicts=('idris2-api')
source=('git+https://github.com/idris-lang/Idris2.git')
md5sums=('SKIP')

_srcname="Idris2"

pkgver() {
    cd $_srcname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_srcname"

    PREFIX="/usr/lib" make src/IdrisPaths.idr
    idris2 --build idris2api.ipkg
}

package() {
    cd "$srcdir/$_srcname"
    
    # change to DESTDIR or equivalent if and when Idris 2 or its makefile gets support.
    # it depends on the network library, which is provided by the idris2 packages
    # here is a PR that attempts to add support to its makefile: https://github.com/idris-lang/Idris2/pull/1123
    IDRIS2_PACKAGE_PATH="$(idris2 --libdir)" IDRIS2_PREFIX="$pkgdir/usr/lib" idris2 --install idris2api.ipkg

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

