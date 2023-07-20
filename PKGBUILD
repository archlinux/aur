# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-vuetify
# _npm_base=vuetify
# _npm_font_base=@mdi/font
pkgname=python-${_base}
pkgdesc="Vuetify widgets for trame"
pkgver=2.3.1
# _npm_pkgver=3.3.9
# _npm_font_pkgver=7.2.96
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python-trame-client)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-gallium npm)
checkdepends=(python-pytest python-trame-server)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
# https://registry.npmjs.org/${_npm_base}/-/${_npm_base}-${_npm_pkgver}.tgz
# https://registry.npmjs.org/${_npm_font_base}/-/${_npm_font_base:5:4}-${_npm_font_pkgver}.tgz
sha512sums=('5ecb7e5771a2c2c881423e4d7409e8293fbc24d6b40401d2b8d8a784a8100b8909f19643a074fa13891be312ec76db6fcf5c2fc856cc8a86a75470d6fde55c6a')
# '404ff25ef1ca0e794af6c8e3328672f5c028bcd69ba48f7bc60f510fe98010381251a64d097fe3cbb427d1b3f50e324d780b11da802570ed02d9686bb187bd93'
# '8ecc1117aab77aaf0d5a95a2a9cb7aabee8583f23b9d486bc5825f88433c249a5aa74c1524b41d6cab724bae467652bb4bb62d9f1dd34e2fdb9b0fad0619069a'

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
  # mkdir -p ${_base}-${pkgver}/${_base/-/_}/module/vue3-serve/{fonts,css}
  # mv ${srcdir}/package/dist/${_npm_base}.min.css ${srcdir}/${_base}-${pkgver}/${_base/-/_}/module/vue3-serve/${_npm_base}3.css
  # mv ${srcdir}/package/dist/${_npm_base}.min.js ${srcdir}/${_base}-${pkgver}/${_base/-/_}/module/vue3-serve/${_npm_base}3.js
  # mv ${srcdir}/package/css/materialdesignicons.min.css ${srcdir}/${_base}-${pkgver}/${_base/-/_}/module/vue3-serve/css/mdi.css
  # mv ${srcdir}/package/fonts/materialdesignicons-webfont.woff2 ${srcdir}/${_base}-${pkgver}/${_base/-/_}/module/vue3-serve/fonts
}

build() {
  cd ${srcdir}/${_base}-${pkgver}/vue2
  npm install
  npm run build

  # cd ${srcdir}/${_base}-${pkgver}/vue3
  # npm install
  # npm run build

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
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/ui/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
