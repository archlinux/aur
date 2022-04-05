# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyrate-limiter
pkgname=python-${_base}
pkgdesc="Python Rate-Limiter using Leaky-Bucket Algorimth Family"
pkgver=2.6.3
pkgrel=1
arch=(any)
url="https://github.com/vutran1710/PyrateLimiter"
license=(MIT)
depends=(python)
makedepends=(python-build python-install python-poetry)
# checkdepends=(python-pytest python-fakeredis python-django python-django-redis)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('d2e32a1296f3817a4383e87972f4dd58686edc38157e0663be9157a2503557082d68339060ce0dcd5f4a04a4887a1901e28f7267e033fd6c277609c21bc8de33')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m install --optimize=1 dist/*.whl
#   test-env/bin/python -m pytest tests -k 'not redis_cluster'
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
  rm ${pkgdir}${site_packages}/LICENSE
}
