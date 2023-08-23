# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-simput
pkgname=python-${_base}
pkgdesc="Simput implementation for trame"
pkgver=2.3.3
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache)
depends=(python-trame-client python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-gallium npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d2333bc9e5a31c7d4b1faa7cc5416c2df3240159ab29baa3a02a26f5c234e470060bd982bbc81ad03d4c5d887e88ad51e42f8abb592eaca3442341b9dbca65a1')

build() {
  # Workaround: https://stackoverflow.com/a/69746937/9302545
  export NODE_OPTIONS=--openssl-legacy-provider
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
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
