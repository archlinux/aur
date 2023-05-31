# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=panel
pkgname=python-${_base}
pkgver=1.0.4
pkgrel=1
pkgdesc="The powerful data exploration & web app framework for Python"
arch=(any)
url="https://${_base}.holoviz.org"
license=('custom:BSD-3-clause')
depends=(python-bokeh python-pyviz_comms python-markdown python-linkify-it-py python-tqdm python-bleach) # python-mdit-py-plugins
makedepends=(python-build python-installer python-setuptools npm)
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('01bf709e9d99ca24e88fc3af0a6c193ddb15e373c95ad5920dd5151481b7b898532a394b600eb93cbe6c943c57a09b7aeed65c4651669c20cfb1c21821e7f92d')

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
