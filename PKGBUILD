# Maintainer: nanpuyue <nanpuyue@gmail.com>

pkgname=fcitx-qimpanel
pkgver=2.1.3
_tagname=$pkgname-$pkgver
pkgrel=1
pkgdesc="An input method frontend for fcitx. It's a standalone application written in Qt/QML."
arch=('x86_64')
url="https://github.com/lmq3342xja/fcitx-qimpanel"
license=('GPL3')
depends=('fcitx' 'qt4')
makedepends=('cmake' 'gettext')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_tagname.tar.gz"
        'replace-system-tray-icon.patch'
        'fcitx-qimpanel-autostart'
        'fcitx-qimpanel-autostart.desktop')
sha256sums=('31f1fa8ce1a28d55d6131364d8eb8951715c2c4c853c16ae3c156fcd598a5b76' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  mkdir -p build
  cd $pkgname-$_tagname
  patch -Np1 -i "$srcdir/replace-system-tray-icon.patch"
}

build() {
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DVERSION=$pkgver \
    ../$pkgname-$_tagname
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/bin" "$pkgdir/etc/xdg/autostart"
  install -m755 fcitx-qimpanel-autostart "$pkgdir/usr/bin"
  install -m644 fcitx-qimpanel-autostart.desktop "$pkgdir/etc/xdg/autostart"
}
