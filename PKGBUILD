# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=syrupy
pkgname=python-${_base}
pkgdesc="The sweeter pytest snapshot plugin"
pkgver=4.0.2
pkgrel=1
arch=(any)
url="https://github.com/tophat/${_base}"
license=(Apache)
depends=(python-pytest python-colored)
makedepends=(python-build python-installer python-poetry-core)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('357c2a599a30d36af89b6426a249d3971570de2bee91838526b3f6f37129175e4d862cc37caf5e6606b15bd519717faabcfbf545b247f90d5e89a9aa2de5336e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest #-k 'not update_failure_shows_snapshot_diff'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
