# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-rca
pkgname=python-${_base}
pkgdesc="Remote Controlled Area widget for trame"
pkgver=0.4.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache)
depends=(python-trame-client python-wslink)
makedepends=(python-build python-installer python-setuptools python-wheel nodejs-lts-gallium npm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b669a74d4bf555ec4770a58050f3e1a4acbd7a755c5b14a68a5b36ff2e5a1d5860c8613600d6e6dcf8320a03b76fabb2740fa542f89e8c5556dc119afa190aad')

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
