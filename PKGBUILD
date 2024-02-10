# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaARM
pkgname=python-${_base,,}
pkgver=0.3.7
pkgrel=1
pkgdesc="A minimalistic framework for numerical association rule mining"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niapy python-nltk)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('9d7432bc0ef9aaad0fcf3cc0b867a0500dc88f2e5a193cdbc54cd48ce150cff1d85a3e31db4fa7258d018cfabeb5d2ceed3826b1ad95c08b27bc9d9304beb269')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base,,}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
