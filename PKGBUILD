# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami2
pkgver=5.56.0
pkgrel=2
pkgdesc='A QtQuick based components set'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5)
depends=(qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects)
makedepends=(extra-cmake-modules qt5-tools qt5-svg kpackage doxygen)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz"{,.sig}
        kdebug-405001a.patch::"https://cgit.kde.org/kirigami.git/patch/?id=4bf1d0e8"
        kdebug-405001b.patch::"https://cgit.kde.org/kirigami.git/patch/?id=58d9ecd3")
sha256sums=('fea01ea5d277a1d415a3b2f0fe8f7659bf345933c4fd1c78c5f92fab40c97e5d'
            'SKIP'
            '49d278b5c676d1ea788a46734b22cd6b40c079ae5bee51d32fcf7696a1833acd'
            'f4d8654442474c9efe016093b8047560e6f7495887bb5d11681bda7db8c9dc5e')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../kdebug-405001a.patch # Fix systemsettings freeze
  patch -p1 -i ../kdebug-405001b.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

