# Contributor: karnath <karnathtorjian@gmail.com>
# Former Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Sergey Khorev <sergey.khorev@gmail.com>
pkgname=open-axiom
pkgver=1.4.2
pkgrel=5
pkgdesc="open source platform for symbolic, algebraic, and numerical computations"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('sbcl' 'texlive-core')
depends=('qt4' 'libxpm')
options=('!strip' '!emptydirs')
url="http://www.open-axiom.org"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2" "LICENSE")
md5sums=('521850b13eaefdf4662823da16c97897' 'eec8e6188dcdf22d27683c197cea75e8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i configure -e 's/for ac_prog in moc/for ac_prog in moc-qt4/' \
	-e 's/for ac_prog in qmake/for ac_prog in qmake-qt4/' \
	-e "s/lt_prog_compiler_static='-static'/lt_prog_compiler_static=''/" \
	-e "s/lt_prog_compiler_static_CXX='-static'/lt_prog_compiler_static_CXX=''/"
    ./configure --prefix=/usr --with-lisp=sbcl
    make -j1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
    install -D -m644 "$srcdir/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
