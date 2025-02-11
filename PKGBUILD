# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-plotly
# _npm_base=plotly.js-dist-min
pkgname=python-${_base}
pkgdesc="Plotly figure widget for trame"
pkgver=3.1.0
# _npm_pkgver=3.0.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python-trame-client python-plotly)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs npm)
checkdepends=(python-pytest)
optdepends=('python-plotly: for Plotly integration')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
# https://registry.npmjs.org/${_npm_base}/-/${_npm_base}-${_npm_pkg/ver}.tgz
sha512sums=('7b6daec9e6c4a1bd470b1a13054d29769cea480857563a009a85f58f1c499fa97b3ef38792431bc970087b8f3d318e84b40e2a62dbd01b32b477b46be65b214b')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  cd ${srcdir}/${_base}-${pkgver}/vue-components
  npm install
  npm run build

  cd ${srcdir}/${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # # Install trame-vtk.js
  # mv ${srcdir}/package/dist/${_npm_base::-3}.min.js ${pkgdir}${site_packages}/${_base/-/_}/module/serve/trame-plotly.umd.js

  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
