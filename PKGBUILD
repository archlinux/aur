# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
# Contributor: JP-Ellis <josh@jpellis.me>
pkgname=lhapdf
pkgver=6.1.6
pkgrel=2
pkgdesc="A particle physics tool for evaluating PDFs from discretised data files."
arch=('x86_64' 'i686')
url="http://lhapdf.hepforge.org/"
license=('GPL3')
depends=('python')
optdepends=('python2')
makedepends=('boost' 'sed')
install=lhapdf.install
source=("http://www.hepforge.org/archive/lhapdf/LHAPDF-$pkgver.tar.gz"
        "python3.patch")
noextract=()
md5sums=('cbcb12cc5f6f5c763a3a13ce5e31169f'
         '87c51fed090b3783480b9cd01c522190')

prepare() {
	patch -p 1 < python3.patch
}

build() {
	cd "$srcdir/LHAPDF-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/LHAPDF-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/LHAPDF-$pkgver"
	make DESTDIR="$pkgdir/" install

	# If python2 is present, also build a library for it
	if [ -x /usr/bin/python2 ]; then
	  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
	   make DESTDIR="$pkgdir/" install
	fi

  sed -i -e "s/'rb'/'r'/g" ${pkgdir}/usr/bin/lhapdf
}
