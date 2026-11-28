# Maintainer: Agildo Gomes da Silva <agomesdasilva99@gmail.com>
# Upstream: https://github.com/juglesbass/AgildoMonitor — etiqueta v${pkgver}

pkgname=agildomonitor
_githubuser=juglesbass
_repo=AgildoMonitor

pkgver=2.0.0
pkgrel=1

pkgdesc="Monitor de hardware e processos Liquid Glass em C++20/Qt6 para Linux"
arch=("x86_64")
url="https://github.com/${_githubuser}/${_repo}"
license=("GPL-3.0-or-later")

depends=(
  "gcc-libs"
  "glibc"
  "kirigami"
  "kwindowsystem"
  "qt6-base"
  "qt6-declarative"
)
makedepends=(
  "cmake"
  "extra-cmake-modules"
  "ninja"
)
optdepends=(
  "pciutils: nome detalhado da GPU AMD via lspci (chamado uma única vez no arranque)"
  "nvidia-utils: métricas de GPU NVIDIA via nvidia-smi assíncrono"
)

install="${pkgname}.install"

_source_file="${_repo}-${pkgver}.tar.gz"
source=("${_source_file}::https://github.com/${_githubuser}/${_repo}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b0aaffef41f8078caa9dbb5b8d9a4972b11e76019c0eed99f15ab1ae4a072032')

build() {
  cd "${srcdir}/${_repo}-${pkgver}"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build --parallel
}

check() {
  cd "${srcdir}/${_repo}-${pkgver}"
  QT_QPA_PLATFORM=offscreen LANG=C.UTF-8 ctest --test-dir build --output-on-failure
}

package() {
  cd "${srcdir}/${_repo}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
}
