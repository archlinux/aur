# Maintainer of regular package: Antonio Rojas <arojas@archlinux.org>
# Version with debug build of plasmoidviewer: Martchus <martchus@gmx.net>

pkgname=plasmoidviewer-debug
_pkgname=plasma-sdk
pkgver=5.27.8
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Debug build of plasmoidviewer allowing to debug QML code'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(plasma-framework5)
makedepends=(extra-cmake-modules perl kdoctools5 ktexteditor5)
options=(!strip)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig}
        0001-Enable-QML-debugging.patch)
sha256sums=('9f961d5ce3a5fe7e945eb397d103435954669baba521f04a81a40345f47490bb'
            'SKIP'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
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
