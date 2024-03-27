# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=panel
pkgname=python-${_base}
pkgver=1.4.0
pkgrel=1
pkgdesc="The powerful data exploration & web app framework for Python"
arch=(any)
url="https://${_base}.holoviz.org"
license=(BSD-3-Clause)
depends=(python-bokeh python-pyviz_comms python-markdown python-linkify-it-py python-tqdm python-bleach) # python-mdit-py-plugins
makedepends=(python-build python-installer python-setuptools python-wheel npm)
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('ce02e538e098760ac1f60a9b62d9f5e0d65c231616ef46fb38cce2b00d2461a2fa42799e5353b85faebf738166943735052982d0515f4a4923ba9ee27e6f6e29')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
