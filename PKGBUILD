# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tiptop
pkgname=${_base}-cli
pkgdesc="Command-line system monitoring"
pkgver=0.2.4
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-py-cpuinfo python-distro python-psutil python-textual)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks)
provides=(${_base})
conflicts=(${_base})
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8b12978addf8e24192e37de07f4099a1c51e63d037900831d79ee7e96f41d2b6229978d1c1012170925cc1b80064b40b2d3e72b0b2453c3cf0d321469cf6d597')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  chmod +x test-env/bin/${_base}
  PATH="${PWD}/test-env/bin:$PATH" test-env/bin/python -m pytest --codeblocks
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # https://github.com/FFY00/python-install/pull/6
  chmod +x ${pkgdir}/usr/bin/*

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
