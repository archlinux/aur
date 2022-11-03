# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=syrupy
pkgname=python-${_base}
pkgdesc="The sweeter pytest snapshot plugin"
pkgver=3.0.3
pkgrel=1
arch=(any)
url="https://github.com/tophat/${_base}"
license=(Apache)
depends=(python-pytest python-colored)
makedepends=(python-build python-installer python-poetry-core)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('24eaf1f1d1844f82a94ccb85b008fc97298a5f81c709528ee4b1d63633b00ab7a5766ef019dcb8faaa98f1105acdb2dbd8a70aad6f74f96154939768682c95a0')

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
