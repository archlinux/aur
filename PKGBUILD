# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=nbtutor
pkgdesc="Visualize Python code execution in Jupyter Notebook cells"
pkgver=2.0.3
pkgrel=2
arch=(any)
url="https://github.com/lgpage/${pkgname}"
license=('custom:BSD-3-clause')
depends=(jupyter-notebook)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f55b69ce96c449ad7a1a623135ef94c6b54894680925cce14ea08ab5d1f409a17cd6c59876a8a2f6e8b63206b58c5afb2610c60c2fb2aebe0c0a8084599aebfd')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$pkgdir${site_packages}:PYTHONPATH" jupyter-nbextension install ${pkgname} --py --prefix="$pkgdir/usr/"
  install -Dm 644 LICENCE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
