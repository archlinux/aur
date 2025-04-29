# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=(python-arrow-adbc python-adbc-driver-postgresql python-adbc-driver-flightsql)
_module='arrow-adbc-apache-arrow-adbc'
pkgver='17'
pkgrel=1
pkgdesc="Database connectivity API standard for Arrow"
url="https://arrow.apache.org/adbc/current/index.html"
checkdepends=()
makedepends=(cython go python-build python-installer python-setuptools python-setuptools-scm python-wheel)
license=('Apache-2.0')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/apache/arrow-adbc/archive/refs/tags/apache-arrow-adbc-$pkgver.tar.gz")
sha256sums=('5b07f68e6a86a2211d75eaa6b38b9c438c26320315ba4eef7767b807e06037e3')
build() {
    cmake -S "${_module}-${pkgver}/c" -B build \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DADBC_BUILD_PYTHON=ON \
        -DADBC_DRIVER_POSTGRESQL=ON \
        -DADBC_DRIVER_MANAGER=ON \
        -DADBC_DRIVER_FLIGHTSQL=ON
    cmake --build build
    cd "${srcdir}/${_module}-${pkgver}/python/adbc_driver_postgresql"
    ADBC_POSTGRESQL_LIBRARY="${srcdir}/build/driver/postgresql/libadbc_driver_postgresql.so" python -m build -wn
    cd "${srcdir}/${_module}-${pkgver}/python/adbc_driver_flightsql"
    ADBC_FLIGHTSQL_LIBRARY="${srcdir}/build/driver/flightsql/libadbc_driver_flightsql.so" python -m build -wn
    cd "${srcdir}/${_module}-${pkgver}/python/adbc_driver_manager"
    python -m build -wn
}

package_python-adbc-driver-postgresql() {
    depends=(python-arrow-adbc postgresql-libs)
    cd "${_module}-${pkgver}/python/adbc_driver_postgresql"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
package_python-adbc-driver-flightsql() {
    depends=(python-arrow-adbc)
    cd "${_module}-${pkgver}/python/adbc_driver_flightsql"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
package_python-arrow-adbc() {
    depends=(python python-pyarrow)
    cd "${_module}-${pkgver}/python/adbc_driver_manager"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
