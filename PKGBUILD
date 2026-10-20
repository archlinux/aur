# Maintainer: Wensheng Tang <sp3478 at gmail dot com>

pkgname=krdp-git
pkgver=6.8.80.r797.g8ca5498
pkgrel=1
pkgdesc='Library and server for the Remote Desktop Protocol'
arch=(x86_64)
url='https://invent.kde.org/plasma/krdp'
license=(LGPL-2.0-or-later)
depends=(
  'freerdp>=2:3.32.2'
  glibc
  kcmutils
  kconfig
  kcoreaddons
  kcrash
  kdbusaddons
  kguiaddons
  ki18n
  kirigami
  kirigami-addons
  'kpipewire>=6.7.90'
  kstatusnotifieritem
  'libei>=1.6'
  libstdc++
  libxkbcommon
  pam
  'qt6-base>=6.11.0'
  qt6-declarative
  qtkeychain-qt6
  systemd-libs
  wayland
)
makedepends=(cmake 'extra-cmake-modules>=6.30.0' git ninja plasma-wayland-protocols)
provides=("krdp=$pkgver")
conflicts=(krdp)
source=('krdp::git+https://invent.kde.org/plasma/krdp.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/krdp"
  local version
  version=$(sed -n 's/^set(PROJECT_VERSION "\([^"]*\)").*/\1/p' CMakeLists.txt)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$srcdir/krdp" -B "$srcdir/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON \
    -DBUILD_EXAMPLES=OFF
  cmake --build "$srcdir/build"
}

check() {
  QT_QPA_PLATFORM=offscreen ctest --test-dir "$srcdir/build" --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
