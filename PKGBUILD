# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=kernex
pkgname=python-${_base}
pkgdesc="Stencil computations in JAX"
pkgver=0.2.0
pkgrel=1
arch=(any)
url="https://github.com/ASEM000/${_base}"
license=(MIT)
depends=(python-jax)
makedepends=(python-build python-setuptools python-installer python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('f59e79d310dfb15f2817a0d9021f02637366a9a1aa09b4aea2d06d327f4c657b8fd7358648272f1945758f9f70b6c25f45b5a5c74aa4ee93185477d7db91f01b')

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
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
