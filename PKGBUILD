# Maintainer: Matthias Blankertz <matthias at blankertz dot org>
pkgname=msc-generator
pkgver=4.6.0
pkgrel=1
epoch=
pkgdesc="Draws MSCs from textual descriptions"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/msc-generator/"
license=('AGPL3')
groups=()
depends=(cairo)
makedepends=(help2man texlive-plainextra)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=msc-generator.install
changelog=

source=("http://sourceforge.net/projects/msc-generator/files/msc-generator/v4.6/msc-generator-4.6.tar.gz"
	msc-generator.patch)
noextract=()
sha256sums=('6f993efd775e99faf9163f0e597ee7e0c77312e2ba9a51989a7ebdf3c4c80b2e'
            '0482408cc7e850e79069e0c2728a7fc326afd949031e3eb6f8d7a9dc45c18adc')
build() {
	cd "$srcdir/$pkgname-4.6"

	# Remove Windows links
	rm compile depcomp doc/texinfo.tex doc/mdate-sh install-sh missing
	# Remove stale configure script
	rm configure

	# Convert file to UNIX line endings so patch works
	tr -d '\r' < src/csh.cpp > tmp.cpp
	mv tmp.cpp src/csh.cpp

	# Apply patch
	patch -p1 -i ../msc-generator.patch

	aclocal
	automake -a
	autoconf
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-4.6"
	make check
}

package() {
	cd "$srcdir/$pkgname-4.6"
	make DESTDIR="$pkgdir/" install
}
