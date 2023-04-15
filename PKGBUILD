# Maintainer: Ayush Shenoy <ayush.shenoy92@gmail.com>
# Contributor: Asmund Ervik <aaervik@gmail.com>
pkgname=hoomd-blue
pkgver=v3.11.0
pkgrel=1
pkgdesc="A general-purpose particle simulation toolkit using GPUs with CUDA"
arch=("any")
url="https://glotzerlab.engin.umich.edu/hoomd-blue"
license=("custom:BSD-3-Clause")
depends=('python' 'boost' 'cuda>=11.0.0' 'cmake' 'openmpi' 'cereal' 'pybind11' 'eigen')
makedepends=(git)
optdepends=('nvidia: running simulations on GPU')
provides=(hoomd-blue)
source=("hoomd-blue::git+https://github.com/glotzerlab/hoomd-blue#tag=$pkgver")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    git submodule update --init
	mkdir -p build && cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS=-march=native -DCMAKE_C_FLAGS=-march=native \
    -DENABLE_CUDA=ON -DENABLE_MPI=ON -DSINGLE_PRECISION=ON \
    -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda
}

package() {
    # Install the license
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
    # Install the software
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir" install

    # Uncomment this if you want to test the install (takes quite a long time):
	#make check -j8
}
