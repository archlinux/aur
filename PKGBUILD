# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyrate-limiter
pkgname=python-${_base}
pkgdesc="Python Rate-Limiter using Leaky-Bucket Algorithm"
pkgver=2.8.2
pkgrel=1
arch=(any)
url="https://github.com/vutran1710/PyrateLimiter"
license=(MIT)
depends=(python)
makedepends=(python-build python-install python-poetry)
checkdepends=(python-pytest python-fakeredis python-django python-django-redis)
optdepends=('python-filelock: for create file lock in module scope to reuse across buckets'
  'python-redis: for use a bucket with Redis using List')
# 'python-redis-py-cluster: for support Redis cluster')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a2273ee8c34fb35691d764ddfe9efbe08cab7da5e2a315160e40b5aa1f65308985440b90a4b5db1a33797f94147d8c66c02717e9e9eddd8d6a416035ae1164c2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m install --optimize=1 dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove duplicate, see https://github.com/vutran1710/PyrateLimiter/blob/master/pyproject.toml#L16
  # rm ${pkgdir}${site_packages}/LICENSE
}
