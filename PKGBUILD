# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=mpb-git
pkgver=1.5.r60.g654c4a1
pkgrel=1
pkgdesc='MIT Photonic-Bands: computation of photonic band structures in periodic media'
arch=('i686' 'x86_64')
url='https://github.com/stevengj/mpb'
license=('GPL2')
depends=('lapack' 'hdf5' 'fftw-mpi' 'libctl-git')
makedepends=('gcc-fortran')
optdepends=('h5utils: visualization and conversion of scientific data')
provides=('mpb')
conflicts=('mpb')
source=('git+https://github.com/stevengj/mpb.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mpb"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"
	cp -r mpb mpbi
	cp -r mpb mpb-mpi
	cp -r mpb mpbi-mpi

	cd mpb
	./autogen.sh \
		--prefix=/usr \
		--enable-shared \
		--mandir=/usr/share/man
	make

	cd ../mpbi
	./autogen.sh \
		--prefix=/usr \
		--enable-shared \
		--mandir=/usr/share/man \
		--with-inv-symmetry
	make

	cd ../mpb-mpi
	./autogen.sh \
		--prefix=/usr \
		--enable-shared \
		--mandir=/usr/share/man \
		--with-mpi
	make

	cd ../mpbi-mpi
	./autogen.sh \
		--prefix=/usr \
		--enable-shared \
		--mandir=/usr/share/man \
		--with-inv-symmetry \
		--with-mpi
	make
}

package() { 
	cd "$srcdir"/mpb
	make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 

	cd ../mpbi
	make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 

	cd ../mpb-mpi
	make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 

	cd ../mpbi-mpi
	make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 
}
