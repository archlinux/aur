# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=openant
pkgname=python-${_base,,}
pkgdesc="ANT, ANT-FS and ANT+ Python Library"
pkgver=1.3.4
pkgrel=1
arch=(any)
url="https://github.com/Tigge/${_base}"
license=(MIT)
depends=(python-pyusb)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  fix-import.patch::${url}/pull/115.patch)
sha512sums=('de8ea644293a2a0ee2b3671ee392d1e55703685c8936df8f0cd52581d8e9d7a09b661a6da4f68eaa02ae3832f7797c649d56e4cc496079ba60874392e4f3830e'
            '5c30c29be902a002e279c7283a5f0f02f28691d564e94171836bdeb77dfaa4e9bda0644685bb44518cb09cc6ccd8cdb35b65ffecd694e17f7c1cce37d495fd90')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../fix-import.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest ${_base}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --prefix=/usr --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
