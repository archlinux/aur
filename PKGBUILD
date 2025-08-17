# Maintainer: artist for Xlibre

pkgname=kwin-x11-improved
_pkgname=kwin-x11
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for Xlibre and Xorg-git'
arch=(x86_64)
url='https://github.com/guiodic/kwin-x11-improved'
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
         kdeclarative
         kdecoration
         kglobalaccel
         kglobalacceld
         kguiaddons
         ki18n
         kirigami
         kitemmodels
         knewstuff
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
         libqaccessibilityclient-qt6
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
         qt6-wayland
         systemd-libs
         wayland
         xcb-util-cursor
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(extra-cmake-modules
             git
             kdoctools
             plasma-wayland-protocols
             python
             wayland-protocols)
groups=(plasma)
provides=($_pkgname)
conflicts=($_pkgname)
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig}
        git+${url}.git)
install=kwin-x11-improved.install
sha256sums=('987e207c2f2ab60e51421b5846ca03e69ef875ac20698022f5e8bdd1e1055ed9'
            'SKIP'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'  # Nicolas Fella <nicolas.fella@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  rm $pkgname/0002-randr-filter.patch
  cd $_pkgname-$pkgver
  for p in ../$pkgname/*.patch
    do
      patch -Np1 -i $p
    done
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

