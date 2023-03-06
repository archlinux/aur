# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkscreen
pkgver=5.27.2
pkgrel=2
pkgdesc='KDE screen management software'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(qt5-x11extras libxrandr kwayland kconfig)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc plasma-wayland-protocols)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/libkscreen/-/commit/e1f3cb77.patch)
sha256sums=('6b7281763a21a40321897164c61384382396784e6853de2e69430da5fbb429cf'
            'SKIP'
            '7b16f7b247d2eff923a5d2b814e3f32dfb7569968f246b6fbf3ef60d2fdacf82')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  patch -d $pkgname-$pkgver -p1 < e1f3cb77.patch # Fix crash when screen disconnects
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
