# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=build
pkgname=pypy3-${_base}
pkgver=1.2.2
pkgrel=1
pkgdesc="A simple, correct PEP 517 build frontend"
arch=(any)
url="https://${_base}.pypa.io"
license=(MIT)
depends=(pypy3-packaging pypy3-pyproject-hooks)
makedepends=(pypy3-installer pypy3-flit-core)
source=(${_base}-${pkgver}.tar.gz::https://github.com/pypa/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('91e14208680915414a87bd3ba31229510a78d82d5504efc40cf7f9c6a7a698cfa4ff523f85c2dd6a56b5e313fae57134f64f2c328c88cd40efe40236b0b661cc')

build() {
  cd ${_base}-${pkgver}
  PYTHONPATH=src pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "$pkgdir/usr"
  mv "${pkgdir}/opt/pypy3/bin" "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
