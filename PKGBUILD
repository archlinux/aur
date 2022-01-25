pkgname=kallisto
pkgver=0.48.0
pkgrel=1
pkgdesc='Quantify abundances of transcripts from RNA-Seq data'
url="http://pachterlab.github.io/$pkgname/"
license=(BSD)
arch=(i686 x86_64)
depends=(hdf5 zlib)
makedepends=(cmake autoconf automake)
source=("https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1797ac4d1f0771e3f1f25dd7972bded735fcb43f853cf52184d3d9353a6269b0')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# https://github.com/pachterlab/kallisto/issues/303#issuecomment-884612169
	pushd ext/htslib
	sed -i '/AC_PROG_CC/a \
AC_CANONICAL_HOST \
AC_PROG_INSTALL \
' configure.ac
	autoreconf -i
	autoheader
	autoconf
	popd

	# add missing header
	sed -i '/#include <algorithm>/a #include <limits>' src/MinCollector.cpp
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	rm -rf build
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make install
}
