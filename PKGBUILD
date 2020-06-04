# Maintainer : Maël Kerbiriou <m431.ker.biriou at gmail dot com>

pkgbase=duckdb-git
pkgname=('duckdb-git' 'python-duckdb-git')
pkgver=v0.1.8.r6.g439acd03a
pkgrel=1
pkgdesc="Embeddable SQL OLAP Database Management System"
arch=('x86_64')
url="https://www.duckdb.org/"
license=('MIT')
makedepends=('git' 'cmake')
checkdepends=('python-pytest')
depends=('gcc-libs' 'python-numpy' 'python-pandas')
provides=('duckdb' 'python-duckdb')
source=("${pkgbase}::git+https://github.com/cwida/${pkgbase%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cmake -S "${srcdir}/${pkgbase}" -B "${srcdir}/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DBUILD_TESTING=ON
}

build() {
  cd "${srcdir}/build"
  make

  cd "${srcdir}/${pkgbase}/tools/pythonpkg"
  python setup.py build
}

check() {
  cd "${srcdir}/${pkgbase}"
  "${srcdir}/build/test/unittest"

  cd "${srcdir}/${pkgbase}/tools/pythonpkg"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.8" pytest
}

package_duckdb-git() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/${pkgbase}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-duckdb-git() {
  cd "${srcdir}/${pkgbase}/tools/pythonpkg"
  python setup.py install --root="${pkgdir}"

  install -D -m644 "${srcdir}/${pkgbase}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
