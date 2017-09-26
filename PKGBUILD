# $Id$
# Maintainer of regular package: Antonio Rojas <arojas@archlinux.org>
# Version with debug build of plasmoidviewer: Martchus <martchus@gmx.net>

pkgname=plasma-sdk-debug
pkgver=5.10.5
pkgrel=1
pkgdesc="Applications useful for Plasma development (with debug build of plasmoidviewer)"
arch=(i686 x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(plasma-framework)
makedepends=(extra-cmake-modules kitemmodels python2 kdoctools ktexteditor)
optdepends=('kirigami2: for Look & Feel explorer')
conflicts=(${pkgname%-debug} ${pkgname%-debug}-git)
options=(!strip)
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/${pkgname%-debug}-$pkgver.tar.xz"{,.sig}
        '0001-Enable-QML-debugging.patch')
sha256sums=('cb833632b3baa4c9952c0096924acf8b1a0b918d4d162eb136c46631026f5656'
            'SKIP'
            'asdf')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '348C8651206633FD983A8FC4DEACEA00075E1D76'  # KDE Neon
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

prepare() {
  mkdir -p build

  cd ${pkgname%-debug}-$pkgver
  patch -Np1 -i ../0001-Enable-QML-debugging.patch
}

build() {
  cd build
  cmake ../${pkgname%-debug}-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DPLASMOIDVIEWER_DEBUG:BOOL=ON
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  find "$pkgdir/usr/bin" -not -iname 'plasmoidviewer' -exec strip --strip-all {} \;
  find "$pkgdir/usr/lib" -iname '*.so' -exec strip --strip-unneeded {} \;
}
