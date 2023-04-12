# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor Antonio Rojas <arojas@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

_base=pyodbc
pkgname=python-${_base}
pkgver=4.0.38
pkgrel=1
pkgdesc="ODBC module for Python"
arch=('x86_64')
url="https://github.com/mkleehammer/${_base}"
license=(MIT)
depends=(python unixodbc)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0d9059e5d9a7f9d2984b987fab411d5e411490b7ab4250e874ac156f7a4000ca957331055eae62c4cc6d51dd5b7e6055c575c437659386eed06f2d54669484bf')

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
