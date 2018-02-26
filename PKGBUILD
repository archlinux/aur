# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tom K <tomk@runbox.com>
# Contributor: Aaron Ali <t0nedef@causal.ca>
# AUR4 Maintainer: McNoggins <gagnon88 AT gmail DOT com>

pkgname=mpb
pkgver=1.5
pkgrel=3
pkgdesc="A program for computing the band structures and electromagnetic modes"
arch=('i686' 'x86_64')
url="https://mpb.readthedocs.io"
license=('GPL')
depends=('lapack' 'hdf5' 'fftw-mpi' 'libctl' 'openmpi')
makedepends=('gcc-fortran')
source=(git+https://github.com/stevengj/$pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | cut -d-  -f1
}

build() {
	cd "${srcdir}/${pkgname}"
	git checkout ${pkgver}
	cp -r $pkgname-$pkgver $pkgname-$pkgver-inv
	cp -r $pkgname-$pkgver $pkgname-$pkgver-mpi
	cp -r $pkgname-$pkgver $pkgname-$pkgver-inv-mpi

	# configure includes two options for working with GNU Fortran and HDF5 v1.8.x
	cd $pkgname-$pkgver
	./configure \
		F77="gfortran" \
		CPPFLAGS="-DH5_USE_16_API=1" \
		--prefix=/usr \
		--enable-shared \
		--mandir=/usr/share/man
	make

	# configure inversion symmetry binaries (run at least 2x as fast)
	cd ../$pkgname-$pkgver-inv
	./configure \
		F77="gfortran" \
		CPPFLAGS="-DH5_USE_16_API=1" \
		--prefix=/usr \
		--enable-shared \
		--with-inv-symmetry \
		--mandir=/usr/share/man
	make

	# configure parrallel computation
	cd ../$pkgname-$pkgver-mpi
	./configure \
		F77="gfortran" \
		CPPFLAGS="-DH5_USE_16_API=1" \
		--prefix=/usr \
		--enable-shared \
		--with-mpi \
		--mandir=/usr/share/man
	make

	# configure parrallel computation
	cd ../$pkgname-$pkgver-inv-mpi
	./configure \
		F77="gfortran" \
		CPPFLAGS="-DH5_USE_16_API=1" \
		--prefix=/usr \
		--enable-shared \
		--with-inv-symmetry \
		--with-mpi \
		--mandir=/usr/share/man
	make
}

package() { 
	cd "$srcdir"/$pkgname-$pkgver
	make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 

	cd "$srcdir"/$pkgname-$pkgver-inv
	make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 

	cd "$srcdir"/$pkgname-$pkgver-mpi
	make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 

	cd "$srcdir"/$pkgname-$pkgver-inv-mpi
	make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 
}

