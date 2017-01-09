# Maintainer: Oliver Mader <b52@reaktor42.de>

pkgname='opengm-git'
pkgver=r2125.31e01c6
pkgrel=2
pkgdesc="A C++ Library for Discrete Graphical Models"
arch=('i686' 'x86_64')
url="https://github.com/opengm/opengm"
license=('MIT')
depends=()
makedepends=('git' 'cmake' 'boost' 'python-numpy')
optdepends=('python-numpy: Python support' 'python-h5py: Python support'
            'boost-libs: Python support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/bluescarni/opengm.git#branch=python3')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

    sed -i 's/find_package(Boost COMPONENTS python REQUIRED)/find_package(Boost COMPONENTS python3 REQUIRED)/' src/interfaces/python/opengm/CMakeLists.txt
    sed -i 's/Boost_PYTHON_LIBRARIES/Boost_PYTHON3_LIBRARIES/g' src/interfaces/python/opengm/*/CMakeLists.txt
}

build() {
	cd "$srcdir/${pkgname%-git}"

    mkdir -p build/ && cd build/

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TUTORIALS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTING=OFF \
        -DBUILD_PYTHON_WRAPPER=ON \
        -DWITH_BOOST=ON \
        -DWITH_HDF5=ON \
        -DWITH_OPENMP=ON \
        ..

    make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"

    make DESTDIR="$pkgdir/" install

    rm -rf "$pkgdir/"{hdf5,inference,opengmcore}
}
