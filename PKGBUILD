# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-components
pkgname=python-${_base}
pkgdesc="Core components for trame widgets"
pkgver=2.1.1
pkgrel=2
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache)
depends=(python-trame-client)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('076a65c550f456f9e76c587796f504515c9db7f45e6c2b15ac2b95ad47ab0022544d0d93a5467ad4122c1ed46cb095f31e6c4133492625007bfe6a76c6ad19d2')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
