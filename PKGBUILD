# Maintainer: qubeck <qubeck :AT: disroot :DOT: org>

pkgname=qqsp-git
pkgver=1.9.r247.67aa5bc
pkgrel=1
pkgdesc='Qt Quest Soft Player (Qt6 fork)'
arch=(x86_64)
url='https://github.com/yetanotherqubick/Qqsp'
license=('MIT AND GPL-2.0-or-later')
depends=(
  glibc
  hicolor-icon-theme
  libgcc_s.so
  libqsp-legacy.so
  libstdc++.so
  qt6-base
  qt6-multimedia
  qt6-webchannel
  qt6-webengine
)
makedepends=(
  cmake
  git
  qt6-tools
)
provides=(${pkgname%-git}=${pkgver})
conflicts=(${pkgname%-git})
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}

  printf "1.9.r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${pkgname}

  local cmake_options=(
    -B build
    -W no-author
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd ${pkgname}

  QT_QPA_PLATFORM=offscreen ctest \
    --test-dir build \
    --output-on-failure
}

package() {
  cd ${pkgname}

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
