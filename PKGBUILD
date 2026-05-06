# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-login-manager
pkgver=6.6.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
arch=(x86_64)
pkgdesc='Plasma Login Manager'
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kauth
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kirigami
         kpackage
         kservice
         kwindowsystem
         layer-shell-qt
         libplasma
         libxau
         pam
         plasma-workspace
         qt6-5compat
         qt6-base
         qt6-declarative
         sh
         systemd-libs)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/plasma-login-manager/-/commit/304413ce.patch)
sha256sums=('3b4a3838459011115a97a4563be20907070cace91ba9679dc7fa43dced44cd1e'
            'SKIP'
            '224c32dc5f57b453fe97a4ee8ffd865d85aa207792852514d23eae22c81359b6')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  patch -d $pkgname-$pkgver -p1 < 304413ce.patch # Delay plasmalogin startup until pending udev events have settled
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
