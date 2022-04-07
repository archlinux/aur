# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyrateLimiter
pkgname=python-pyrate-limiter
pkgdesc="Python Rate-Limiter using Leaky-Bucket Algorimth Family"
pkgver=2.7.0
pkgrel=1
arch=(any)
url="https://github.com/vutran1710/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-install python-poetry)
checkdepends=(python-pytest python-fakeredis python-django python-django-redis)
optdepends=('python-filelock: for create file lock in module scope to reuse across buckets'
  'python-redis: for use a bucket with Redis using List')
# 'python-redis-py-cluster: for support Redis cluster')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('25398d7b0199f6d2d967c6442599e35ec7fcf37bf6099f9692b4a2f73ab6dd571b8590a6059dc6eec681b6b197225002b1f5aab91c8ffe76c0ad1f579b4f8cb0')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  test-env/bin/python -m pytest tests -k 'not redis_cluster and not sleep'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/pyrate_limiter-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove duplicate, see https://github.com/vutran1710/PyrateLimiter/blob/master/pyproject.toml#L16
  rm ${pkgdir}${site_packages}/LICENSE
}
