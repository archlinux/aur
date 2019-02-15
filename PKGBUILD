# Maintainer of regular package: Antonio Rojas <arojas@archlinux.org>
# Version with debug build of plasmoidviewer: Martchus <martchus@gmx.net>

pkgname=plasmoidviewer-debug
_pkgname=plasma-sdk
pkgver=5.15.0
pkgrel=1
pkgdesc='Debug build of plasmoidviewer allowing to debug QML code'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(plasma-framework)
makedepends=(extra-cmake-modules kitemmodels python2 kdoctools ktexteditor)
options=(!strip)
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/${_pkgname}-$pkgver.tar.xz" # {,.sig}
        '0001-Enable-QML-debugging.patch')
sha256sums=('a8a514775ded362b4b15190eb451bc0ef7b2564630f6937daf871a92311eb812'
            '1c612d2cb08e9435e265120a2f94b13a62833344abea7eb2dd7c03a93ba6ed56')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build

  cd ${_pkgname}-$pkgver
  patch -Np1 -i ../0001-Enable-QML-debugging.patch
}

build() {
  cd build
  cmake ../${_pkgname}-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DPLASMOIDVIEWER_DEBUG:BOOL=ON
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/bin/plasmoidviewer" "$srcdir/$pkgname"
  rm -r "$pkgdir/"*
  mkdir -p "$pkgdir/usr/bin"
  mv "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
