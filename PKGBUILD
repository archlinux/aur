# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=tasque
pkgver=0.1.12
pkgrel=6
pkgdesc="Easy quick task management app written in C Sharp"
arch=('any')
url="https://wiki.gnome.org/Attic/Tasque"
license=('MIT')
depends=('notify-sharp' 'sqlite')
makedepends=('intltool')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz
        tasque.appdata.xml
        dbus-sharp-2-porting.patch
        use_dbussharp_2.patch)
sha256sums=('db4d4a822cfa87ce8cf311189e17fa8fbda37e7c943874b6bf62c6a84b2d824d'
            'f5d76db752d95eedde81857cfa9a46caa21e9d7528f8992e0b3d9a992a8ca624'
            '9bcd0f2e854ade96203a44ca7e322d20e0a197057ea2c2271099720a211006b1'
            'b75cdba593bcd28beef7e55212511f5ebedda38a25c210b16226d9db4b180ef6')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../dbus-sharp-2-porting.patch
  patch -Np1 -i ../use_dbussharp_2.patch
  autoreconf -fi
}
build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-appindicator
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 ../tasque.appdata.xml "$pkgdir/usr/share/metainfo/tasque.appdata.xml"
  rm -r "$pkgdir/usr/share/pixmaps/"
}
