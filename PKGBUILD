# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=kernex
pkgname=python-${_base}
pkgdesc="Stencil computations in JAX"
pkgver=0.2.1
pkgrel=1
arch=(any)
url="https://github.com/ASEM000/${_base}"
license=(MIT)
depends=(python-jax)
makedepends=(python-build python-setuptools python-installer python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('dbe7b7e275e457ee8079d6ccb15791f30c09d73c128987adf8d5a5a384293446e2a080ba10f89e6a0b7674dbe7d27b3690aff546f96caf31b308d08d511800d5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not mesh[pmap] and not lax_scan_with_kmap[pmap] and not conv2d[pmap] and not and_time_conv2d and not and_time_patch'
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
