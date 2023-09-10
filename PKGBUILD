pkgbase=faiss
pkgname=('faiss-cpu' 'faiss-cuda')
pkgdesc='A library for efficient similarity search and clustering of dense vectors.'
arch=('x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=1.7.4
pkgrel=1
source=("https://github.com/facebookresearch/faiss/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9a7b31bf7fd6eb32c10b7ea7ff918160eed5be04fe63bb7b4b4b5f2bbde01ad')
depends=('blas' 'lapack' 'openmp' 'python' 'python-numpy' )
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'cuda' 'swig')

prepare() {
	cd $srcdir
	cp -r faiss-$pkgver faiss
  cp -r faiss-$pkgver faiss-cuda
}

build() {
	# regular
	cd "${srcdir}/faiss"
	mkdir build && cd build
	cmake -DFAISS_ENABLE_GPU=OFF \
        -DBUILD_TESTING=OFF \
	      -DFAISS_ENABLE_PYTHON=ON \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      ..
	make
	cd faiss/python
	python -m build --wheel --no-isolation

	# cuda
	cd "${srcdir}/faiss-cuda"
	sed -i "/CMAKE_CUDA_HOST_COMPILER/d" CMakeLists.txt
	mkdir build && cd build
	cmake -DFAISS_ENABLE_GPU=ON \
        -DBUILD_TESTING=OFF \
	      -DCUDAToolkit_ROOT=/opt/cuda \
	      -DFAISS_ENABLE_PYTHON=ON \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      ..
	make
	cd faiss/python
	python -m build --wheel --no-isolation
}

package_faiss-cpu() {
	provides=('faiss' 'python-faiss' 'python-faiss-cpu')
	cd "${srcdir}/faiss/build"
	make DESTDIR="$pkgdir" install
	install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd faiss/python
	python -m installer --destdir="$pkgdir" dist/*.whl
}

package_faiss-cuda() {
	provides=('faiss' 'python-faiss' 'python-faiss-cuda')
  depends+=('cuda')
	cd "${srcdir}/faiss-cuda/build"
	make DESTDIR="$pkgdir" install
	install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd faiss/python
	python -m installer --destdir="$pkgdir" dist/*.whl
}