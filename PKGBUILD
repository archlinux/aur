# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='extrae'
pkgdesc='Instrumentation framework to generate execution traces of the most used parallel runtimes (from BSC).'
pkgver='3.7.1.20191001'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL2.1')
depends=(openmpi libunwind papi libxml2 zlib python)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        extrae-issue-27-fix-pie-address-translation.patch
        extrae-Fix-references-to-the-build-directory.patch)
sha512sums=(51e8f77082069e2aceaae49d15b9f40cb1f9b66810d334f98f4bb5df5a61b8648b25b0a5adec5ab646d18c45f591fb7762a8a7604a8368ff06938d6e86b12a60
            3b0fae157fcc6e85be3a5565c2ea3abe8bf35e130de96435a93ba7b3f4b6c30df8982823d36c494633a2c16671664112558393faeead05226b96aa521bb14fba
            1f4e5ab8b375cd456c3f4d0356e33f99d3fd49152b3147a0fdc5317368b1df11bdbda809720c38959c698e885615e961d37a87d3ad6b6b85a3a2caf0c1117db1)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	patch -Np1 -i "$srcdir/extrae-issue-27-fix-pie-address-translation.patch"
	patch -Np1 -i "$srcdir/extrae-Fix-references-to-the-build-directory.patch"

	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# NOTE: The following optional features are NOT enabled:
	# * Automatic instrumentation (with dyninst)
	# * CUDA support
	# * OpenCL support
	# * LaTeX documentation
	./configure \
		--prefix=/usr \
		--with-mpi=/usr \
		--with-mpi-libs=/usr/lib/openmpi \
		--with-mpi-headers=/usr/include/openmpi \
		--with-unwind=/usr \
		--with-unwind-headers=/usr/include \
		--with-unwind-libs=/usr/lib \
		--with-papi=/usr \
		--with-papi-headers=/usr/include \
		--with-papi-libs=/usr/lib \
		--without-dyninst

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	make DESTDIR="$pkgdir/" install
}