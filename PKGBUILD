# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=requests-ratelimiter
pkgname=python-${_base}
pkgdesc="Rate-limiting for the requests library"
pkgver=0.6.0
pkgrel=1
arch=(any)
url="https://github.com/JWCook/${_base}"
license=(MIT)
depends=(python-requests python-pyrate-limiter)
makedepends=(python-build python-installer python-poetry-core)
# checkdepends=(python-pytest python-requests-mock)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b10f2973219f3341ebc3c7b2feb7530cebdd308e94ac0bd86e66022c2d31343440d7fd12d2dabb0a2a90d77a5869f16723cf35a62988dd105b95ff6862c7908b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest test
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
