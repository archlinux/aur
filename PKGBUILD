# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tiptop
pkgname=${_base}-cli
pkgdesc="Command-line system monitoring"
pkgver=0.2.0
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
sha512sums=('c5ddbb4d4ae8b7d0235cf8260e29f1558400724bc527abccadded99b79bfb63f27ab180b5721f0cfc6a074d1f79d1bec80f94253ef41a984a5abdf74036b80df')

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
