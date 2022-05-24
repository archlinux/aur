# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=panel
pkgname=python-${_base}
pkgver=0.13.1
pkgrel=1
pkgdesc="A high-level app and dashboarding solution for Python"
arch=(any)
url="https://${_base}.holoviz.org"
license=('custom:BSD-3-clause')
depends=(python-bokeh python-pyviz_comms python-markdown python-tqdm python-pyct python-bleach)
makedepends=(python-setuptools npm)
source=(${_base}-${pkgver}::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('d190cf1e97c362a8cc2fb94267c9129abfe01808c0c873b9fd2e29653b1be764576db571a137715f8c1a428a16bb3daace106f85fdd6597817c59434c8371d37')

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
