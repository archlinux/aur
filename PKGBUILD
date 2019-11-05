# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=genn
pkgver=4.1.0
pkgrel=1
epoch=2
pkgdesc="GeNN: GPU-enhanced neural networks (version 4)"
arch=(x86_64)
url="https://github.com/genn-team/genn"
license=('GPL')
depends=(cuda)
makedepends=(doxygen doxypypy python python-numpy swig)
optdepends=("python: for pygenn" "python-numpy: for pygenn" "spinecreator: for spineml2genn")
options=(staticlibs !emptydirs)
source=("$url/archive/${pkgver//_/-}.tar.gz")
sha256sums=('db4b7f5096b77b7179564a6d59bf81b8430a80c79558734d36a5307110ce1629')
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
	sh ./makedoc.sh > /dev/null

	# Build libgenn.a etc.
	make
	make cuda

	# Build pygenn
	make DYNAMIC=1 LIBRARY_DIRECTORY=`pwd`/pygenn/genn_wrapper/
	python setup.py build

	# Build SpineML stuff
	cd src/spineml/
	for dname in common simulator standalone_simulator; do
		make -C $dname
	done
	cd generator
	make -f MakefileCUDA
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

	# Install standalone SpineML generator
	install -m755 bin/spineml_* "$pkgdir"/usr/bin

	# Install SpineML2GeNN libs
	install -m644 lib/libspineml_*.a "$pkgdir"/usr/lib

	# Copy SpineML2GeNN headers
	cp -R include/spineml "$pkgdir"/usr/include

	# Automatically set CUDA_PATH environment variable
    install -d "${pkgdir}"/etc/profile.d
    echo export CUDA_PATH=/opt/cuda > "${pkgdir}"/etc/profile.d/cuda_path.sh

	# Install pygenn
	python setup.py install --prefix=/usr --root="$pkgdir"
}
