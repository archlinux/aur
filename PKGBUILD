# Maintainer: jemand <wertzlino@gmail.com>
pkgname=cancept
_pkgname=CANcept
pkgver=1.2.0
pkgrel=1
pkgdesc="A CAN-Centric Environment for Automotive Bus Testing and Analysis"
arch=('x86_64')
url="https://github.com/CANcept/CANcept"
license=('Apache-2.0')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'ninja' 'git')
source=("git+https://github.com/CANcept/CANcept.git#tag=v$pkgver"
        "git+https://github.com/skypjack/entt.git"
        "git+https://github.com/gabime/spdlog.git"
        "git+https://github.com/SimonCahill/libsockcanpp.git"
        "git+https://github.com/xantares/qwt-cmake.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$_pkgname"
  git submodule init external/entt external/spdlog external/libsockcanpp \
                      external/qwt
  git config submodule.external/entt.url "$srcdir/entt"
  git config submodule.external/spdlog.url "$srcdir/spdlog"
  git config submodule.external/libsockcanpp.url "$srcdir/libsockcanpp"
  git config submodule.external/qwt.url "$srcdir/qwt-cmake"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "$_pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=OFF \
    -DENABLE_TESTS=OFF \
    -DENABLE_DOCS=OFF \
    -DENABLE_CLANG_TIDY=OFF \
    -Wno-dev
  cmake --build build
}

package() {

  install -Dm755 build/CANcept "$pkgdir/usr/bin/CANcept"
  install -Dm644 "$_pkgname/assets/icon/app_root/can_bus.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/CANcept.svg"
  install -Dm644 "$_pkgname/cancept.desktop" \
    "$pkgdir/usr/share/applications/cancept.desktop"
}