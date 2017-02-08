# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgorigname=kwin
pkgname=kwin-presentwindows-close
pkgver=5.9.1
pkgrel=1
pkgdesc='KDE Window manager, reverting the removal of the close action in present windows'
arch=('i686' 'x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
depends=('qt5-multimedia' 'kscreenlocker' 'knewstuff' 'xcb-util-cursor' 'hicolor-icon-theme'
         'plasma-framework' 'kcmutils' 'breeze')
makedepends=('extra-cmake-modules' 'qt5-tools' 'kdoctools' 'python')
optdepends=('qt5-virtualkeyboard: virtual keyboard support for kwin-wayland')
groups=('plasma')
conflicts=('kdebase-workspace', 'kwin')
provides=('kwin')
source=("http://download.kde.org/stable/plasma/${pkgver}/${_pkgorigname}-${pkgver}.tar.xz"{,.sig}
        "presentwindows-close.patch")
sha256sums=('2ab9c9693f87b5ac40f5f4b57e9c157b7cfeaf62e4d399571817eabc607e1a0b'
            'SKIP'
            'a42e050f873632240595026b0f0f98ce4e109dd36a7768ba6b361d1b4854aefb')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '348C8651206633FD983A8FC4DEACEA00075E1D76'  # KDE Neon
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

prepare() {
  # allow middle click close of windows
  cd $_pkgorigname-$pkgver
  patch -p1 -R < ../presentwindows-close.patch
  cd $srcdir

  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgorigname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
