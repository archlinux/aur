# Maintainer: Michael Helmling <michaelhelmling@posteo.de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
_base=pytaglib
pkgname=python-${_base}
pkgver=2.0.0
pkgrel=1
pkgdesc="Python audio tagging library"
arch=(x86_64)
url="https://github.com/supermihi/${_base}"
license=(GPL3)
depends=(python taglib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cb5cb49f11b69b6b9a5b06cc779dcfe68fe0c46c8dc95d0bb482e2d71f5a7f05a002df7b5aadebb7d459e1daa88a960e1b46332d12157d6bbe8678dcdf7ba760')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
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
