# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=toml-adapt
pkgdesc="A very simple cli for manipulating toml files"
pkgver=0.2.4
pkgrel=1
arch=(any)
url="https://github.com/firefly-cpp/${pkgname}"
license=(MIT)
depends=(python-toml python-click)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest)
optdepends=('man-db: manual pages for toml-adapt')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('f1ea4229e4f4f2bda90e3c7c79bb12de72c36c8f26c2ad7a2f1cea57a0ca39b263af2f1ee0b2a4fdcea3e07eeb1ca14fbcdcf95abf5aabc038d6d9da3033c8b5')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # https://github.com/FFY00/python-install/pull/6
  chmod +x ${pkgdir}/usr/bin/*

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 ${pkgname}.1 -t "${pkgdir}/usr/share/man/man1/"
}
