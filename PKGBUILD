# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgorigname=kwin
pkgname=kwin-presentwindows-close
pkgver=5.10.2
pkgrel=2
pkgdesc='KDE Window manager, reverting the removal of the close action in present windows'
arch=('i686' 'x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
depends=('kscreenlocker' 'xcb-util-cursor' 'hicolor-icon-theme' 'plasma-framework' 'kcmutils' 'breeze')
makedepends=('extra-cmake-modules' 'qt5-tools' 'kdoctools' 'python')
optdepends=('qt5-virtualkeyboard: virtual keyboard support for kwin-wayland')
groups=('plasma')
conflicts=('kdebase-workspace', 'kwin')
provides=('kwin')
source=("https://download.kde.org/stable/plasma/${pkgver}/${_pkgorigname}-${pkgver}.tar.xz"{,.sig}
        kdebug-360841.patch::"https://cgit.kde.org/kwin.git/patch/?id=a6dee74e"
        kdebug-380440.patch::"https://cgit.kde.org/kwin.git/patch/?id=c45e1655"
        "presentwindows-close.patch")
sha256sums=('f257f48c1ac2bfef12b6e953565514448c05391c65daaca181561783a6f16bbf'
            'SKIP'
            '7aa428ad31ca3f4f345ae215e7f43aa28159c288652c79d084eea93b6820e65f'
            'd2c30904b103d724ff1fa2dc127dca204e3b6e56e8bbc6978c9a1442209629d2'
            'a42e050f873632240595026b0f0f98ce4e109dd36a7768ba6b361d1b4854aefb')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '348C8651206633FD983A8FC4DEACEA00075E1D76'  # KDE Neon
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

prepare() {
  mkdir -p build

# Fix keyboard input in desktop effects https://bugs.kde.org/show_bug.cgi?id=360841
  cd $_pkgorigname-$pkgver
  patch -p1 -i ../kdebug-360841.patch
# Fix switching desktops through edge https://bugs.kde.org/show_bug.cgi?id=380440
  patch -p1 -i ../kdebug-380440.patch

# allow middle click close of windows
#  cd $_pkgorigname-$pkgver
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
