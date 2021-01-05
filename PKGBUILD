# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=genn
pkgver=4.4.0
pkgrel=1
pkgdesc="GeNN: GPU-enhanced neural networks"
epoch=2
arch=(x86_64)
url="https://github.com/genn-team/genn"
license=('GPL')
depends=(cuda)
makedepends=(doxygen doxypypy python python-setuptools python-numpy swig)
optdepends=("python: for pygenn" "python-numpy: for pygenn" "spinecreator: for spineml2genn")
options=(staticlibs !emptydirs)
source=("$url/archive/${pkgver//_/-}.tar.gz")
sha256sums=('554ebd9373a2965c1dc854c0b1db4ed0139213474599ebd62691bd224542d286')
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
	mkdir -p "$pkgdir"/usr/share/doc/genn
	cp -rf documentation/html/* "$pkgdir"/usr/share/doc/genn

	# Copy userproject folder
	mkdir -p "$pkgdir"/usr/share/genn
	cp -R userproject "$pkgdir"/usr/share/genn/

	# Make symlinks to userproject headers
	pushd "$pkgdir"/usr/share/genn/userproject/include
	for file in *; do
		ln -s /usr/share/genn/userproject/include/$file "$pkgdir"/usr/include/genn/
	done
	popd

	# Install standalone SpineML generator
	install -m755 bin/spineml_* "$pkgdir"/usr/bin

	# Install SpineML2GeNN libs
	install -m644 lib/libspineml_*.a "$pkgdir"/usr/lib

	# Automatically set CUDA_PATH environment variable
	install -d "${pkgdir}"/etc/profile.d
	echo export CUDA_PATH=/opt/cuda > "${pkgdir}"/etc/profile.d/cuda_path.s

	# Copy SpineML2GeNN headers
	cp -R include/spineml "$pkgdir"/usr/include/

	# The headers in common don't seem to always get included properly
	pushd "$pkgdir"/usr/include/spineml/common
	for f in *;do
		ln -s /usr/include/spineml/common/$f "$pkgdir"/usr/include/spineml/
	done
	popd

	# Install pygenn
	python setup.py install --prefix=/usr --root="$pkgdir"
}
