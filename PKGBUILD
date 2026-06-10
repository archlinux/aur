# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-simput
pkgname=python-${_base}
pkgdesc="Simput implementation for trame"
pkgver=2.6.4
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache-2.0)
depends=(python-trame-client python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-iron npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a836a416dbd108e5106aa57f8c3e8e4faa6e8d37c3d25932f00de1f36ffdec7fd2d0027c930963236fd9d4d51395df08b1a3dbcc4130decf97d57515991034f3')

build() {
  # Workaround: https://stackoverflow.com/a/69746937/9302545
  # export NODE_OPTIONS=--openssl-legacy-provider
  # cd ${srcdir}/${_base}-${pkgver}/vue2-components
  # npm install
  # npm run build

  cd ${srcdir}/${_base}-${pkgver}/vue3-components
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
