# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshzoo
pkgname=python-${_base}
pkgdesc="A collection of meshes for canonical domains"
pkgver=0.9.4
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-numpy)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks python-matplotlib)
optdepends=('python-matplotlib: for Matplotlib rendering in 2d')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9614ab57da33d443c9708d6a7440bcb718e190e43429ace8e49cc3fe3fb03de70aacb3c0bf5b0844c1c4fb3443ee124a2d985e78d8f7c6f623592303c7803b71')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest --codeblocks
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
