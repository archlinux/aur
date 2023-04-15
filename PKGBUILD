# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor Antonio Rojas <arojas@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

_base=pyodbc
pkgname=python-${_base}
pkgver=4.0.39
pkgrel=1
pkgdesc="ODBC module for Python"
arch=('x86_64')
url="https://github.com/mkleehammer/${_base}"
license=(MIT)
depends=(python unixodbc)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1f54eedc44acc32844cac22b1689d18c9ef789c1ff8da33eed5063937471a13dd28666f4b96081089b244e379d07bc60a8c5f59a275c440e1556f0206c037b47')

prepare() {
  echo "Version: ${pkgver}.0" >${_base}-${pkgver}/PKG-INFO
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm "$pkgdir${site_packages}"/pyodbc.pyi
}
