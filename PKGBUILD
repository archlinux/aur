# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=toml-adapt
pkgdesc="A very simple cli for manipulating toml files"
pkgver=0.2.5
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${pkgname}"
license=(MIT)
depends=(python-toml python-click)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest)
optdepends=('man-db: manual pages for toml-adapt')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('316697eb9bd4b6c1b760ae92a5326d63762e5f9255c308a796691cc42ee2999d02d9bfe704b9f372ace24074a2923d83a8bc09b1769ef2b71978f33fb129505f')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # https://github.com/FFY00/python-install/pull/6
  chmod +x ${pkgdir}/usr/bin/*

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ${pkgname}.1 -t "${pkgdir}/usr/share/man/man1/"
}
