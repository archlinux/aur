# Maintainer: Jerzy Drozdz <jerzy.drozdz@example.com>
# Original Maintainer: Felix Yan <felixonmars@archlinux.org>
# Original Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kwin-screencast-border
pkgver=6.5.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='An easy to use, but flexible, Wayland compositor (with screencast border indicator and D-Bus API)'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(aurorae
         breeze
         gcc-libs
         glibc
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
         libinput
         libpipewire
         libqaccessibilityclient-qt6
         libxcb
         libxcvt
         libxkbcommon
         mesa
         pipewire-session-manager
         libplasma
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-svg
         qt6-tools
         systemd-libs
         wayland
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(extra-cmake-modules
             kdoctools
             krunner
             plasma-wayland-protocols
             python
             wayland-protocols
             xorg-xwayland)
optdepends=('plasma-keyboard: virtual keyboard')
provides=("kwin=$pkgver")
conflicts=('kwin')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/kwin-$pkgver.tar.xz{,.sig}
        add-screencast-border-indicator.patch)
install=kwin.install
sha256sums=('3be0d569fe342daddee859bab6aefda32d7056b601e84038e8af92593f140774'
            'SKIP'
            '7a5fe92fead55beab702278666fd46c738a7460ac362751666d6b0fe9a8ad99d')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'  # Nicolas Fella <nicolas.fella@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd kwin-$pkgver

  # Apply screencast border indicator patch
  # Adds D-Bus API for stream introspection and consumer tracking
  # Adds visual feedback for active screencasts
  patch -p1 -i "$srcdir/add-screencast-border-indicator.patch"
}

build() {
  cmake -B build  -S kwin-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
