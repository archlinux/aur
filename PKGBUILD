# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=holoviews
pkgname=python-${_base}
pkgver=1.22.1
pkgrel=1
pkgdesc="With Holoviews, your data visualizes itself"
arch=(any)
url="https://${_base}.org"
license=(BSD-3-Clause)
depends=(python-panel python-colorcet)
makedepends=(python-build python-installer python-hatch-vcs python-wheel)
optdepends=('jupyter-nbconvert: for use holoviews command')
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('a49ac98ab198e6ca8460c968c6ea18cfa81dbef6ccfb2c7f9fd8308f93e36a6e71ed7fd8995ae642e71ec5f60c75f037baf45dc98ce61ad831036e722c3aef0f')

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
}
