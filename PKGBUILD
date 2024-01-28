# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=findiff
pkgname=python-${_base}
pkgdesc="Python package for finite difference derivatives in any number of dimensions"
pkgver=0.10.0
pkgrel=1
arch=(any)
url="https://github.com/maroba/${_base}"
license=(MIT)
depends=(python-scipy python-sympy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
optdepends=('python-matplotlib: for plotting support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c790c85ff036c9ee9da774487ac5ce340b22b208947c04aa3e6dd52ca24e87ee4483c4082d7a0ec9bc85a35ea865a85c50affc32a3e3f80441305ebe4290744d')

build() {
  cd ${_base}-${pkgver}
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

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
