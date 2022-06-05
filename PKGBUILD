# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=mpb-git
pkgver=1.11.1.r12.g84de012
pkgrel=1
pkgdesc='MIT Photonic-Bands: computation of photonic band structures in periodic media'
arch=('i686' 'x86_64')
url='https://github.com/NanoComp/mpb'
license=('GPL2')
depends=('lapack' 'hdf5' 'fftw' 'libctl-git')
makedepends=('gcc-fortran')
optdepends=('h5utils: visualization and conversion of scientific data')
provides=("mpb=${pkgver}")
conflicts=('mpb')
source=('git+https://github.com/NanoComp/mpb.git')
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
