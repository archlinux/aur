# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=genn
pkgver=4.0.0_RC1
pkgrel=6
pkgdesc="GeNN: GPU-enhanced neural networks (version 4)"
arch=(x86_64)
url="https://github.com/genn-team/genn"
license=('GPL')
depends=(cuda)
makedepends=(doxygen python python-numpy swig)
optdepends=("python: for pygenn" "python-numpy: for pygenn")
options=(staticlibs !emptydirs)
source=("$url/archive/${pkgver//_/-}.tar.gz")
sha256sums=('b94c0b8c05d8525987f9d4279478dd41f68e8d9824cb5344adb5fbe257b38e99')
install="${pkgname}.install"

export CUDA_PATH=/opt/cuda

prepare() {
	cd genn-${pkgver//_/-}

	# Set output dir
	sed -i "s|/usr/local|$pkgdir/usr|" Makefile

	# Delete tmp files
	find . -name '*~' -delete
}

build() {
	cd genn-${pkgver//_/-}

	# Generate documentation with doxygen
	msg2 "Generating documentation"
	./makedoc > /dev/null

	# Build libgenn.a etc.
	make
	make cuda

	# Build pygenn
	make DYNAMIC=1 LIBRARY_DIRECTORY=`pwd`/pygenn/genn_wrapper/
	python setup.py build
}

package() {
	cd genn-${pkgver//_/-}

	# Install libs and headers
	PREFIX="$pkgdir"/usr/ make install

	# Install documentation
	mkdir -p "$pkgdir"/usr/share/genn/documentation
	cp -rf documentation/html/* "$pkgdir"/usr/share/genn/documentation

	# Copy userproject folder
	cp -R userproject "$pkgdir"/usr/src/genn

	# Automatically set CUDA_PATH environment variable
    install -d "${pkgdir}"/etc/profile.d
    echo export CUDA_PATH=/opt/cuda > "${pkgdir}"/etc/profile.d/cuda_path.sh

	# Install pygenn
	python setup.py install --prefix=/usr --root="$pkgdir"
}
