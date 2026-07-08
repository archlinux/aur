# Maintainer: PenguinBurner contributors

pkgname=penguin-burner
pkgver=0.6.3
pkgrel=1
pkgdesc='NVIDIA GPU automatic undervolting and fine tuning tool'
arch=('x86_64')
url='https://github.com/jpietek/PenguinBurner'
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'hicolor-icon-theme'
  'pyside6>=6.7'
  'python'
  'python-colorama>=0.4'
  'python-pyqtgraph>=0.13'
)
makedepends=(
  'cmake'
  'mingw-w64-gcc'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'vulkan-headers'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jpietek/PenguinBurner/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "PenguinBurner-${pkgver}"
  export PENGUIN_BURNER_REQUIRE_NATIVE_LAYER=1
  # MinGW cross-compiles the NVAPI latency shim into the wheel; fail loudly
  # if the toolchain is missing instead of shipping the feature hollow.
  export PENGUIN_BURNER_REQUIRE_NVAPI_SHIM=1
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "PenguinBurner-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
