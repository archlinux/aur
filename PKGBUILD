# Mantainer: Alberto Santini <alberto dot santini at upf dot edu>

pkgname='concorde'
pkgdesc='Travelling Salesman Problem Solver'

pkgver='03.12.19'
pkgrel='1'
arch=('x86_64')
url='http://www.math.uwaterloo.ca/tsp/concorde/index.html'
license=('custom')
depends=('cplex')
options=('!buildflags')

source=('http://www.math.uwaterloo.ca/tsp/concorde/downloads/codes/src/co031219.tgz'
        'machdefs.h.patch'
        'LICENSE')

sha256sums=('c3650a59c8d57e0a00e81c1288b994a99c5aa03e5d96a314834c2d8f9505c724'
            'b189efe02afc73af92ba61011debe35b099f3765d157d9e6e713d8725323be00'
            'eb01297dfd2c9a1d6804e18a3af817bb3fa7b9e8b20628f71618f31cf7d7738c')

prepare() {
    cd "$srcdir/concorde"

    mkdir -p local_cplex
    cd local_cplex

    ln -fs /usr/include/ilcplex/* .
    ln -fs /usr/lib/libcplex.a .

    cd ..

    # Apply patch to fix an API-breaking change in recent Cplex versions
    patch -p0 < "$srcdir/machdefs.h.patch"
}

build() {
    cd "$srcdir/concorde"
    ./configure --with-cplex="$srcdir/concorde/local_cplex" --enable-pthreads --prefix=/usr
    make
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
