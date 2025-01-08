# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-arrow-adbc'
_module='arrow-adbc-apache-arrow-adbc'
pkgver='15'
pkgrel=1
pkgdesc="Database connectivity API standard for Arrow"
url="https://arrow.apache.org/adbc/current/index.html"
depends=(python python-pyarrow postgresql-libs python-pandas)
checkdepends=()
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
license=('Apache-2.0')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/apache/arrow-adbc/archive/refs/tags/apache-arrow-adbc-$pkgver.tar.gz")
sha256sums=('a803bfce26e2f462f750464161dbfebbbf2f52d91bdef838d84ab01c93c8b51d')

build() {
    cmake -S "${_module}-${pkgver}/c" -B build \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DADBC_BUILD_PYTHON=ON \
        -DADBC_DRIVER_POSTGRESQL=ON \
        -DADBC_DRIVER_MANAGER=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    cd "${_module}-${pkgver}/python"
    for d in adbc_driver_postgresql adbc_driver_manager;
    do
        pushd $d
        ADBC_POSTGRESQL_LIBRARY="${pkgdir}/usr/lib/libadbc_driver_postgresql.so" python -m build -wn
        python -m installer --destdir="${pkgdir}" dist/*.whl
        popd
    done
}
