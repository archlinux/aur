# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=panel
pkgname=python-${_base}
pkgver=0.14.1
pkgrel=1
pkgdesc="A high-level app and dashboarding solution for Python"
arch=(any)
url="https://${_base}.holoviz.org"
license=('custom:BSD-3-clause')
depends=(python-bokeh python-pyviz_comms python-markdown python-tqdm python-pyct python-bleach)
makedepends=(python-setuptools npm)
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('6c0bbea10c689fbcb8bfaf0f8fa701abc6baa5ab7f7cb9d4963a6b4393792222611441222724f9e273f1aa164ef50240f326f2572ea6f8db5c3996b3931d4549')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
