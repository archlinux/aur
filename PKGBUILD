# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyrate_limiter
pkgname=python-${_base/_/-}
pkgdesc="Python Rate-Limiter using Leaky-Bucket Algorithm"
pkgver=2.10.0
pkgrel=1
arch=(any)
url="https://github.com/vutran1710/PyrateLimiter"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-poetry)
checkdepends=(python-pytest python-fakeredis python-django python-django-redis) # python-redis-py-cluster
optdepends=('python-filelock: for create file lock in module scope to reuse across buckets'
  'python-redis: for use a bucket with Redis using List')
# 'python-redis-py-cluster: for support Redis cluster')
source=(PyrateLimiter-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b0090b2d80d40ba2f86ac7b5c5612a35fa885b52a87d783aa9726782275e79ca8d54a9a44b1f0dd43c98bf2355f4c17e1686d7c7f806934ea492b67f66b06ffe')

build() {
  cd PyrateLimiter-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd PyrateLimiter-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not redis_cluster'
}

package() {
  cd PyrateLimiter-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
