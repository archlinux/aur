# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=panel
pkgname=python-${_base}
pkgver=1.6.1
pkgrel=1
pkgdesc="The powerful data exploration & web app framework for Python"
arch=(any)
url="https://${_base}.holoviz.org"
license=(BSD-3-Clause)
depends=(python-bokeh python-pyviz_comms python-markdown python-markdown-it-py
  python-linkify-it-py python-mdit_py_plugins python-tqdm python-bleach)
makedepends=(python-build python-installer python-hatch-vcs python-wheel npm)
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('50905227d5823a64e319f78cfe7839c0f30e84d17111806d4280bb259064913b2309840e482d81ccdd33d4142078b34ff9f368c909c48540acccb7cd6ad8f146')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
