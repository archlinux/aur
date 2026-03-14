# Maintainer: schlndh <schlindenbuch.h@seznam.cz>
_pkgname=kwin
pkgname=$_pkgname-povd
pkgver=6.6.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='An easy to use, but flexible, Wayland compositor (patched for per-output virtual desktops)'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(aurorae
         breeze
         gcc-libs
         glibc
         iio-sensor-proxy
         'plasma-activities<6.6.80'
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
         libinput
         libpipewire
         libqaccessibilityclient-qt6
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
         wayland
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(extra-cmake-modules
             kdoctools
             krunner
             plasma-wayland-protocols-povd
             python
             wayland-protocols
             xorg-xwayland)
optdepends=('plasma-keyboard: virtual keyboard')
groups=(plasma)
provides=($_pkgname)
conflicts=($_pkgname)
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig}
        povd.patch)
sha256sums=('89db742659f0c96140ba39b4053ade7e1c20660e7eb82c18b5a68c16f93356e8'
            'SKIP'
            '86e7aef8258ee1617204f50faff1566d8f86956c46259a649e7c5fc4eacbd470')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'  # Nicolas Fella <nicolas.fella@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 < "$srcdir/povd.patch"
}

build() {
  cmake -B build  -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  setcap CAP_SYS_NICE=+ep "$pkgdir"/usr/bin/kwin_wayland
}
