# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=lat
pkgver=1.2.4
pkgrel=5
pkgdesc="LDAP administration tool"
arch=('any')
url="https://sourceforge.net/projects/ldap-at/"
license=('GPL')
depends=('gtk-sharp-2' 'libgnome-keyring')
makedepends=('intltool' 'rarian')
source=(https://downloads.sourceforge.net/ldap-at/$pkgname-$pkgver.tar.gz
        drop-gnome-sharp.patch
        drop-gconf.patch)
sha256sums=('a37f3b5361956e5d664a0f8b767969d012acf67c5a4c99142edfa0d7c7a0890a'
            '7b84b0d1f07a8951971c423549de88213885fef9af10d35151327fbafacf4ecd'
            'bbe3eda800a3c7ff0710cd7934800cb65f76edfd3414639901fc39ef4a29ddc1')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/gmcs/mcs/' configure{,.ac}

  # Remove gnome-sharp dependency
  patch -Np1 -i ../drop-gnome-sharp.patch

  # Remove GConf dependency
  patch -Np1 -i ../drop-gconf.patch

  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # Use standard icon instead of the very small included icon
  sed -i 's/^Icon=.*/Icon=network-server/' "$pkgdir/usr/share/applications/lat.desktop"
  rm -r "$pkgdir/usr/share/pixmaps/"
}
