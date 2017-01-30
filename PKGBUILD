# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgorigname=kwin
pkgname=kwin-presentwindows-close
pkgver=5.8.5
pkgrel=3
pkgdesc='KDE Window manager, reverting the removal of the close action in present windows'
arch=('i686' 'x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
depends=('qt5-multimedia' 'kscreenlocker' 'knewstuff' 'xcb-util-cursor' 'hicolor-icon-theme'
         'plasma-framework' 'kcmutils' 'breeze')
makedepends=('extra-cmake-modules' 'qt5-tools' 'kdoctools' 'python')
optdepends=('qt5-virtualkeyboard: virtual keyboard support for kwin-wayland')
groups=('plasma')
conflicts=('kdebase-workspace' 'kwin')
provides=('kwin')
source=("http://download.kde.org/stable/plasma/${pkgver}/${_pkgorigname}-${pkgver}.tar.xz"{,.sig}
        kwin-qt5.8.patch::"https://cgit.kde.org/kwin.git/patch/?id=052fa2e4"
        "presentwindows-close.patch")
sha256sums=('a703a0d1628e36d3a92dfe3e0a8df7ec733ec2f7a93f854b90a9294dda095fa0'
            'SKIP'
            '271d31f54ea41625138926e7729cb0e3140059e36b5c6cee17965a78dfaea0a8'
            'a42e050f873632240595026b0f0f98ce4e109dd36a7768ba6b361d1b4854aefb')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '348C8651206633FD983A8FC4DEACEA00075E1D76'  # KDE Neon
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

prepare() {
  mkdir -p build

# support Qt 5.8
  cd $_pkgorigname-$pkgver
  patch -p1 -i ../kwin-qt5.8.patch

  # allow middle click close of windows
  cd $srcdir/$_pkgorigname-$pkgver
  patch -p1 -R < ../presentwindows-close.patch
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
