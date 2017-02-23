# Maintainer: Hans Gaiser <hansg91@gmail.com>

pkgname=caffe-dr-git
pkgver=0.rc3.r393.g3c1c4f36
pkgrel=1
pkgdesc='A fast framework for deep learning built in C++ for speed with a Python 3 interface'
arch=(x86_64)
url='https://github.com/delftrobotics-forks/caffe'
license=('BSD')

depends=(
	'cuda'
	'cudnn'
	'leveldb'
	'protobuf'
	'opencv'
	'openblas-lapack'
	'google-glog'
	'gflags'
	'lmdb'
	'cython'
	'ipython'
	'python-pillow'
	'python-numpy'
	'python-yaml'
	'python-numpy'
	'python-scipy'
	'python-scikit-image'
	'python-scikit-learn'
	'python-matplotlib'
	'python-networkx'
	'python-nose'
	'python-dateutil'
	'python-protobuf'
	'boost'
	'boost-libs'
)

source=('git+ssh://git@github.com/delftrobotics/caffe.git#branch=layer-modules')
makedepends=('git' 'gcc-fortran' 'cmake')
provides=('caffe' 'pycaffe' 'python-pycaffe')
conflicts=('caffe' 'pycaffe' 'python-pycaffe')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/caffe"
	set -o pipefail
	echo -n '0.'
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	rm -rf "$srcdir/caffe/build"
	mkdir "$srcdir/caffe/build"
	cd "$srcdir/caffe/build"

	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBLAS="Open" \
		-Dpython_version=3 \
		-DBoost_PYTHON_LIBRARY_RELEASE=/usr/lib/libboost_python3.so \
		-DCUDA_HOST_COMPILER=/usr/bin/g++-5
}

build() {
	cd "$srcdir/caffe/build"
	make
}

package() {
	cd "$srcdir/caffe/build"
	make DESTDIR="${pkgdir}" install

	# Setup Python by hand
	mkdir -p "$pkgdir/usr/lib/python3.6/site-packages/"
	mv "$pkgdir/usr/python/caffe" "$pkgdir/usr/lib/python3.6/site-packages/caffe/"
	rm -rf "$pkgdir/usr/python"

	# Install BSD License
	install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install Documentation
	install -D -m644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
