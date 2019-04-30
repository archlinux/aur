# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=genn
pkgver=4.0.0_RC1
pkgrel=2
pkgdesc="GeNN: GPU-enhanced neural networks (version 4)"
arch=(x86_64)
url="https://github.com/genn-team/genn"
license=('GPL')
depends=(cuda)
makedepends=(doxygen)
options=(staticlibs !emptydirs)
source=("$url/archive/${pkgver//_/-}.tar.gz"
		"set-CUDA_PATH.patch")
sha256sums=('b94c0b8c05d8525987f9d4279478dd41f68e8d9824cb5344adb5fbe257b38e99'
            'a42059714b49bb84ec961053507aa4d2f7658b4ecfb059573a43bc101184c33a')

prepare() {
	cd genn-${pkgver//_/-}

	# Set install path
	sed -i 's|/usr/local|'$pkgdir'/usr|' Makefile

	# Set CUDA_PATH to correct location on Arch
	patch -Np0 < ../set-CUDA_PATH.patch
}

build() {
	cd genn-${pkgver//_/-}

	# Generate documentation with doxygen
	./makedoc

	# Build libgenn.a etc.
	make
}

package() {
	cd genn-${pkgver//_/-}

	# Install libs and headers
	PREFIX="$pkgdir"/usr/ make install

	# Install documentation
	mkdir -p "$pkgdir"/usr/share/genn/documentation
	cp -rf documentation/html/* "$pkgdir"/usr/share/genn/documentation
}
