# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Gilles Gagniard <gilles@gagniard.org>

pkgname=plasma-login-manager-idle
_pkgname=plasma-login-manager
pkgver=6.7.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
arch=(x86_64)
pkgdesc='Plasma Login Manager'
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(glibc
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
         libkscreen
         libplasma
         libstdc++
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
provides=(plasma-login-manager)
conflicts=(plasma-login-manager)
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/plasma-login-manager/-/merge_requests/123.patch)
sha256sums=('8ba5f9a5b31b2cb09d6846c590d09891dadb9a5625426b8552577299093b67fd'
            'SKIP'
            'c9847e3eb299921258fda7319e03de773b6561c3b50c3d2afa9bcf10d76f401f')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  patch -d $_pkgname-$pkgver -Np1 -i "$srcdir/123.patch"
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
