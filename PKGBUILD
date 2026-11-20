# Maintainer: Vittorino_4213
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin-osd-bottom
provides=(kwin)
conflicts=(kwin)
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1.1
pkgdesc='An easy to use, but flexible, Wayland compositor (with the OSD placed at the bottom of the screen)'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(
  aurorae
  breeze
  glibc
  iio-sensor-proxy
  plasma-activities
  kauth
  kcmutils
  kcolorscheme
  kconfig
  kcoreaddons
  kcrash
  kdbusaddons
  kdeclarative
  kdecoration
  kglobalaccel
  kglobalacceld
  kguiaddons
  ki18n
  kidletime
  kirigami
  kitemmodels
  knewstuff
  knighttime
  knotifications
  kpackage
  kquickcharts
  krunner
  kscreenlocker
  kservice
  ksvg
  kwayland
  kwidgetsaddons
  kwindowsystem
  kxmlgui
  lcms2
  libcanberra
  libdisplay-info
  libdrm
  libei
  libepoxy
  libevdev
  libgcc
  libinput
  libpipewire
  libqaccessibilityclient-qt6
  libstdc++
  libxcb
  libxcvt
  libxkbcommon
  mesa
  milou
  pipewire-session-manager
  libplasma
  qt6-5compat
  qt6-base
  qt6-declarative
  qt6-svg
  qt6-tools
  systemd-libs
  vulkan-icd-loader
  wayland
  xcb-util-keysyms
  xcb-util-wm
)
makedepends=(
  extra-cmake-modules
  kdoctools
  krunner
  plasma-wayland-protocols
  python
  vulkan-headers
  wayland-protocols
  xorg-xwayland
)
optdepends=(
  'plasma-keyboard: virtual keyboard'
)
groups=(
  plasma
)
source=(
  https://download.kde.org/stable/plasma/$_dirver/kwin-$pkgver.tar.xz{,.sig}
)
sha256sums=('fd5cb783f220ea4526a9afee2f72b582c3e87ef7f91b19bc5c7a6662ffe7fbdc'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '58743C0A93487794BC44ECE873C3D7758E7A544A'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'  # Nicolas Fella <nicolas.fella@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd kwin-$pkgver
  # Move the OSD (volume/brightness/etc. popups) to the bottom of the screen
  sed -i 's|const int y = area.top() + 2 \* area.height() / 3 - size.height() / 2;|const int y = area.top() + area.height() - size.height() - 60;|' src/placement.cpp
  grep -qF 'const int y = area.top() + area.height() - size.height() - 60;' src/placement.cpp || {
    echo "OSD placement patch did not apply: src/placement.cpp changed upstream" >&2
    return 1
  }
}

build() {
  cmake -B build  -S kwin-$pkgver \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
