# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

_base=pyodbc
pkgname=python-${_base}
pkgver=5.3.0
pkgrel=1
pkgdesc="ODBC module for Python"
arch=(x86_64)
url="https://github.com/mkleehammer/${_base}"
license=(MIT)
depends=(python unixodbc)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('581a034469a0c8288626fcccc255cc25abe887b1be56fa5a3139ae0f2e92a0400f082d811b716bb805c92e0a8925f652779a6f398d9ec5b81270c574ea6ea0a9')

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
