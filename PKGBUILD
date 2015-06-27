# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=aspcud-svn
groups=('potassco')
pkgver=r8385
pkgrel=1
pkgdesc="Solver for package dependencies"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://potassco.sourceforge.net/"
license=('GPL3')
depends=('clasp>=2.1.3' 'gringo>=4.2.1')
conflicts=('aspcud')
provides=('aspcud')
makedepends=('boost' 'cmake' 're2c')
source=("$pkgname"::'svn+svn://svn.code.sf.net/p/potassco/code/trunk/aspcud')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build/release
    cd build/release
    cmake \
	-DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DCUDF2LP_LOC=cudf2lp \
    	-DGRINGO_LOC=gringo \
	-DCLASP_LOC=clasp \
	-DCMAKE_BUILD_TYPE=Release ../..
    make
}

package() {
    cd "$srcdir/$pkgname"
    cd build/release
    make DESTDIR=${pkgdir} install
}
