# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=kwin-zones
pkgver=1.0.11
pkgrel=1
pkgdesc='Wayland ext-zones for KWin'
arch=(x86_64)
url='https://invent.kde.org/automotive/kwin-zones'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kwin
         qt6-base
         qt6-declarative
         wayland)
makedepends=(extra-cmake-modules
             vulkan-headers
             vulkan-icd-loader
             wayland-protocols)
source=(https://invent.kde.org/automotive/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
        https://invent.kde.org/automotive/kwin-zones/-/merge_requests/5.patch
        https://invent.kde.org/automotive/kwin-zones/-/commit/33767fb5.patch)
sha256sums=('25a66c7dad0dd0936b51d5aeff358d7664f549e264c2b7cd37c17cb26e8636a0'
            '9be799cc492b0d75046321fdd740c2b8edb99e2f141dd578598934c0406a1360'
            '4c30da970eb0635bbd93b14813163e2010153c9a059ad5d540c04f76ad1009ea')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/5.patch" # A couple of fixes to make it usable with modern kwin
  patch -p1 -i "$srcdir/33767fb5.patch" # Fix for building against Qt6GuiPrivate & Wayland
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
