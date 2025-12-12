# Maintainer: conf

_pkgname=busylight_core
pkgname=python-busylight-core
pkgver=0.15.3
pkgrel=1
pkgdesc='Busylight Core Implementation for Humans'
arch=('any')
url='https://github.com/JnyJny/busylight-core'
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-uv-build')
depends=(
  'python>=3.11'
  'python-hidapi>=0.14.0'
  'python-loguru'
  'python-pyserial>=3.5'
)

source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bd72045e8614f007b30f599c40e32cb753f5986349799c30822066d1eb8d8695')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # allow to build with newer uv_build version
  find . -type f -name 'pyproject.toml' -exec sed -i -E 's/(requires = \["uv_build>=[0-9.]+,)<0.8"/\1<0.10"/' '{}' ';'
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
