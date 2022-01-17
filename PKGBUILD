# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-codeblocks
pkgname=python-${_base}
pkgdesc="Test code blocks in your READMEs"
pkgver=0.13.0
pkgrel=1
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-pytest)
makedepends=(python-build python-flit-core python-install)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('092035e5cf3d1d35fedbc6f867ff77a40751df5b4a3b922d5f960fdaa5d1ca9e599c7b813ae60a4da3cd43e3e7884f38260f77bc466e234422480b5edebee24a')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  test-env/bin/python -m pytest -p pytester
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
