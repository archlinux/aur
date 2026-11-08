# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

_base=pyodbc
pkgname=python-${_base}
pkgver=5.5.0
pkgrel=1
pkgdesc="ODBC module for Python"
arch=(x86_64)
url="https://github.com/mkleehammer/${_base}"
license=(MIT)
depends=(python unixodbc)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('448eed6ced5fe90bba33ad6358d224e854dca94e2747432c52718651011be68e2e68a0dd6325a20220ff9d08994143a2d5eb7657e3cc53d907855a07ec20afb7')

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
