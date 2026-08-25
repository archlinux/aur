# Maintainer: Jerzy Kołosowski <jerzy@kolosowscy.pl>
# Based on official kwin PKGBUILD by:
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin-screencast-api
pkgver=6.7.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KWin with D-Bus API for screencast stream introspection'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
provides=(kwin=$pkgver)
conflicts=(kwin)
depends=(aurorae
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
         xcb-util-wm)
makedepends=(extra-cmake-modules
             kdoctools
             krunner
             plasma-wayland-protocols
             python
             vulkan-headers
             wayland-protocols
             xorg-xwayland)
optdepends=('plasma-keyboard: virtual keyboard')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/kwin-$pkgver.tar.xz{,.sig}
        screencast-dbus-api.patch)
sha256sums=('db7a7dba71aaca1e5218733b80f90a998d84e2ab36e4d62d0e3ea00376c5802d'
            'SKIP'
            '98392fdf282e39729247458b9c64487b33f9d5248d200a853ca3759fb43c952f')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'  # Nicolas Fella <nicolas.fella@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd kwin-$pkgver
  # D-Bus API for screencast stream introspection, plus fix for a potential
  # null dereference in popup window tracking
  patch -Np1 -i ../screencast-dbus-api.patch
}

build() {
  cmake -B build  -S kwin-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  setcap CAP_SYS_NICE=+ep "$pkgdir"/usr/bin/kwin_wayland
}
