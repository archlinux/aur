# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=concorde-glpk
pkgver=03.12.19
pkgrel=1
_glpkver=4.65
pkgdesc="Travelling Salesman Problem Solver (GLPK back-end)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://www.math.uwaterloo.ca/tsp/concorde/index.html"
license=('custom')
provides=('concorde')
depends=('glpk')
makedepends=()
options=('staticlibs' '!buildflags')
source=("http://www.math.uwaterloo.ca/tsp/concorde/downloads/codes/src/co031219.tgz"
        "https://ftp.gnu.org/gnu/glpk/glpk-${_glpkver}.tar.gz")
sha384sums=('b6eaf8ec6cc6f28f03851169b47e790dcb7352611578052c7fa891073a778af1b28a69c4f4f6598d4a5d5cf9f39ac8d3'
            '0bc17f10390343c6bf0c4149f1eab794dfd669e73e00db63822ee4723567f9a8dedcaae1b6be7fb211f145e90caab287')

build() {
    cd "$srcdir/concorde"
    cp "$srcdir/glpk-${_glpkver}/examples/cplex/cplex.c" "LP/"
    cp "$srcdir/glpk-${_glpkver}/examples/cplex/cplex.h" "LP/"
    echo '#include "cplex.c"' > LP/lpglpk.c
    echo '#include "lpcplex8.c"' >> LP/lpglpk.c
    ./configure --enable-pthreads --prefix=/usr
    make CPPFLAGS=-I. LPSOLVER_INTERFACE=lpglpk.c LPSOLVER_LIB=-lglpk
}

package() {
    cd "$srcdir/concorde"
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "TSP/concorde" "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/include"
    install -m644 concorde.h "$pkgdir/usr/include"
    install -dm755 "$pkgdir/usr/lib"
    install -m755 concorde.a "$pkgdir/usr/lib/libconcorde.a"
    install -dm755 "$pkgdir/usr/share/doc/concorde"
    install -m644 README "$pkgdir/usr/share/doc/concorde"
}
