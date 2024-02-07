# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Robert Knauer <robert@privatdemail.net>

_base=pyodbc
pkgname=python-${_base}
pkgver=5.1.0
pkgrel=1
pkgdesc="ODBC module for Python"
arch=(x86_64)
url="https://github.com/mkleehammer/${_base}"
license=(MIT)
depends=(python unixodbc)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b5586d398e6803526398c5c1b1a1e07b137357e3257db6d86db5bc6cbaea72257fb132e437b164a6a8c31c549e4c24ce753a7650fe1d10252d17a88798754af5')

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
