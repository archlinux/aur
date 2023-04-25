# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-rca
pkgname=python-${_base}
pkgdesc="Remote Controlled Area widget for trame"
pkgver=0.3.1
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache)
depends=(python-trame-client python-wslink)
makedepends=(python-setuptools nodejs-lts-fermium npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('579519fb8dcbfead59574149e21a0947c715fe2139920f1d659fb6cbb0b32ae81511968135cace121e179581c63c3746793eaa71c2180e69e540275cb3e5c343')

build() {
  cd ${srcdir}/${_base}-${pkgver}/vue-components
  npm install
  npm run build
  cd ${srcdir}/${_base}-${pkgver}
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
