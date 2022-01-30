# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ndim
pkgname=python-${_base}
pkgdesc="Multidimensional volumes and monomial integrals"
pkgver=0.1.6
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-sympy)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a2c3d0ec48c2d90d9713289e5ed0a76c72b3ee04f5cb4f6abc74d3f1636a4ac30118e30322c70c006f4a89f8a64ef5e08a568b682112e440fe623a4b994a49f0')

build() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  test-env/bin/python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
