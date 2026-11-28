# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin-x11
pkgver=6.7.6
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='An easy to use, but flexible, X Window Manager'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(aurorae
         breeze
         glibc
         plasma-activities
         kauth
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdeclarative
         kdecoration
         kglobalaccel
         kglobalacceld
         kguiaddons
         ki18n
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
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         lcms2
         libcanberra
         libdisplay-info
         libdrm
         libepoxy
         libgcc
         libqaccessibilityclient-qt6
         libstdc++
         libx11
         libxcb
         libxi
         libxkbcommon
         libxkbcommon-x11
         mesa
         libplasma
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-svg
         qt6-tools
         systemd-libs
         wayland
         xcb-util-cursor
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(extra-cmake-modules
             kdoctools
             plasma-wayland-protocols
             python
             wayland-protocols)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig}
        kwin-x11-plasma6.8-globalshortcuts.patch)
sha256sums=('d1ed8a46bc50e1c96b4bda0996b226cad882430470b15a39f4da860491a4f85a'
            'SKIP'
            'df8c8f57ba8489f4a08079c0b20bc184b4718229a4b352dd6d904c8be9a1db0e')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'  # Nicolas Fella <nicolas.fella@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd $pkgname-$pkgver
  # Port global shortcuts off the removed kglobalaccel_interface.h API and
  # adapt a KSldApp screen-locker API change, both needed for KF6/Plasma 6.8
  patch -Np1 -i "$srcdir/kwin-x11-plasma6.8-globalshortcuts.patch"
}

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
