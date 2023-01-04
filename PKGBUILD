# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyrate_limiter
pkgname=python-${_base/_/-}
pkgdesc="Python Rate-Limiter using Leaky-Bucket Algorithm"
pkgver=2.8.5
pkgrel=1
arch=(any)
url="https://github.com/vutran1710/PyrateLimiter"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-poetry)
checkdepends=(python-pytest python-fakeredis python-django python-django-redis)
optdepends=('python-filelock: for create file lock in module scope to reuse across buckets'
  'python-redis: for use a bucket with Redis using List')
# 'python-redis-py-cluster: for support Redis cluster')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('bd14abc3b55df2b5bca1583ecc2a3a88ef74ec46ed54944e63fc4630a775cf31015a7cb9e0c90ddcb9fd061fd1c0397603e83d7d8c56e23f8b89d3b062716c09')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove duplicate, see https://github.com/vutran1710/PyrateLimiter/blob/master/pyproject.toml#L16
  # rm ${pkgdir}${site_packages}/LICENSE
}
