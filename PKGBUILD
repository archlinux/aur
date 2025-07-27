# Maintainer: Christopher Hillenbrand <chillenb.lists@gmail.com>
# Maintainer: Dan Maftei <dan.maftei@chem.uaic.ro>
pkgname=python-pyscf
_name=pyscf
pkgver=2.10.0
pkgrel=1
pkgdesc="Python module for quantum chemistry"
provides=('python-pyscf')
arch=('x86_64')
url="https://github.com/pyscf/pyscf"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e754266e5dfcb761fd2d033041e225cf5ea0570e0587af5d56cc02ed00589820')
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
