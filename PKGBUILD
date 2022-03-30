# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyrateLimiter
pkgname=python-pyrate-limiter
pkgdesc="Python Rate-Limiter using Leaky-Bucket Algorimth Family"
pkgver=2.6.1
pkgrel=1
arch=(any)
url="https://github.com/vutran1710/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-install python-poetry)
checkdepends=(python-pytest python-fakeredis python-django python-django-redis)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('715ad8463fc2ff9440b8129a69ffea9e72e063854b348a3cad66897f4f909aef5f8ee2d493febbced31d84114141ddea83e1748ae876a7a1bec00a285121b58f')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  test-env/bin/python -m pytest tests -k 'not redis_cluster'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/pyrate_limiter-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # For avoid /usr/bin/test exists in filesystem (owned by coreutils)
  # For avoid /usr/bin/cover exists in filesystem (owned by go-tools)
  # See https://github.com/vutran1710/PyrateLimiter/blob/master/pyproject.toml#L42
  cd "${pkgdir}/usr"
  rm -r bin
}
