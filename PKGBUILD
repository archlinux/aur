# Maintainer: Christopher Hillenbrand <chillenb.lists@gmail.com>
# Maintainer: Dan Maftei <dan.maftei@chem.uaic.ro>
pkgname=python-pyscf
_name=pyscf
pkgver=2.9.0
pkgrel=1
pkgdesc="Python module for quantum chemistry"
provides=('python-pyscf')
arch=('x86_64')
url="https://github.com/pyscf/pyscf"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4407f515f3173dc6f8df2d2e889a2fbaac0279ea04d5d38ceb4753a63a5a222a')
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-scipy' 'python-h5py' 'xcfun' 'libcint' 'libxc' 'blas')
makedepends=('cmake' 'python-build' 'python-installer')
conflicts=(${pkgname}-git)

build() {
    cd "${_name}-${pkgver}"
    CMAKE_CONFIGURE_ARGS="-DCMAKE_BUILD_TYPE=Release \
                          -DCMAKE_INSTALL_PREFIX='/usr' \
                          -DBUILD_SHARED_LIBS=ON
                          -DCMAKE_INSTALL_LIBDIR=lib \
                          -DBUILD_LIBCINT=OFF \
                          -DBUILD_LIBXC=OFF \
                          -DBUILD_XCFUN=OFF \
                          -LAH \
                          -Wno-dev"
    export CMAKE_CONFIGURE_ARGS=$(echo $CMAKE_CONFIGURE_ARGS | tr -d '\n')
    python -m build --wheel --no-isolation -x

}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
