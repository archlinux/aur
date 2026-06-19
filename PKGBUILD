# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-pysfcgal
_pkgname=pysfcgal
pkgver=2.3.0
pkgrel=1
pkgdesc="An official Python wrapper for the SFCGAL library, inspired by Shapely"
arch=('x86_64')
url="https://gitlab.com/sfcgal/pysfcgal"
license=('MIT')
depends=('python' 'sfcgal')
makedepends=('git' 'python-setuptools')
checkdepends=('python-icontract')
source=("$_pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('435c52b846dc758e9cc548417a54f4059b9029a98ea4d4a89e7e4d2d2bccb68a')

build() {
  cd "$srcdir/$_pkgname-v$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-v$pkgver"

    rm -rf "$srcdir/test-install"

    python -m installer --destdir="$srcdir/test-install" dist/*.whl

    export pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    export PYTHONPATH="$srcdir/test-install/usr/lib/python${pyver}/site-packages"
    cp -rf $srcdir/$_pkgname-v$pkgver/tests "$srcdir/test-install/usr/lib/python${pyver}/site-packages"

    cd "$srcdir/test-install/usr/lib/python${pyver}/site-packages"

    pytest tests \
      --deselect tests/test_coredump.py::test_wrap_geom_segfault
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  export pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  rm -rf "${pkgdir}/usr/lib/python${pyver}/site-packages/tests"
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
