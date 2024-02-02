# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=npx
pkgname=python-${_base}
pkgdesc="Some useful extensions for NumPy"
pkgver=0.1.2
pkgrel=1
arch=(any)
url="https://github.com/sigma-py/${_base}"
license=(BSD-3-Clause)
depends=(python-numpy)
makedepends=(python-build python-setuptools python-installer python-wheel)
checkdepends=(python-pytest-codeblocks)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f15b206a27426e3dfadc44b945a36919d926e4bdf52b0cf2c5e20c7153157401bb58d026ae7b0f445a77915623b5770a48456a1b4e24cee1e3c0cd4459179e6d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --codeblocks
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
