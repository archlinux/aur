# Maintainer: Christopher Hillenbrand <chillenb.lists@gmail.com>
# Maintainer: Dan Maftei <dan.maftei@chem.uaic.ro>
pkgname=python-pyscf
_name=pyscf
pkgver=2.6.2
pkgrel=2
pkgdesc="Python module for quantum chemistry"
provides=('python-pyscf')
arch=('x86_64')
url="https://github.com/pyscf/pyscf"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('09c0b064ddd493886b7bee768f33e5df8940436e130118354b869869ec36a2af')
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
