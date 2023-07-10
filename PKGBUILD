# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-vega
pkgname=python-${_base}
pkgdesc="Vega widget for trame"
pkgver=2.0.3
pkgrel=4
arch=(any)
url="https://github.com/Kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-trame-client)
makedepends=(python-build python-installer python-setuptools python-wheel) # nodejs-lts-gallium npm
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  https://pypi.org/packages/py3/${_base::1}/${_base/-/_}/${_base/-/_}-${pkgver}-py3-none-any.whl)
sha512sums=('0eadb709ee1de01781bfa0085ead316cd35fbd014151f969af5dd410134d8e3f24ceff69635ea0899ca9f39f6e2aba56a9939982d3040a9c7a5cb4d4831ea113'
  '3c49078574f982979b3e9de45fbeab7f608e2893d483e6584a6241293593bada68f78f396e1194207732a86c257a2e03b585e6e59b9f7bff06a529e6f17e3b1b')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  # cd ${srcdir}/${_base}-${pkgver}/vue-components
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
  mv ${srcdir}/${_base/-/_}/module/serve ${pkgdir}${site_packages}/${_base/-/_}/module

  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
