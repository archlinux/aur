# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=lat
pkgver=1.2.4
pkgrel=6
pkgdesc="LDAP administration tool"
arch=('any')
url="https://sourceforge.net/projects/ldap-at/"
license=('GPL')
depends=('gtk-sharp-2' 'glade-sharp' 'libgnome-keyring')
makedepends=('intltool' 'rarian')
source=(https://downloads.sourceforge.net/ldap-at/$pkgname-$pkgver.tar.gz
        drop-gnome-sharp.patch
        drop-gconf.patch
        migrate-sslpolicyerrors.patch)
sha256sums=('a37f3b5361956e5d664a0f8b767969d012acf67c5a4c99142edfa0d7c7a0890a'
            '7b84b0d1f07a8951971c423549de88213885fef9af10d35151327fbafacf4ecd'
            'bbe3eda800a3c7ff0710cd7934800cb65f76edfd3414639901fc39ef4a29ddc1'
            'a81b4b34e26eb196ebf07c846eb822fd53094f06005dfc1c65b5e7a0fbeb6bf7')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/gmcs/mcs/' configure{,.ac}

  # Remove gnome-sharp dependency
  patch -Np1 -i ../drop-gnome-sharp.patch

  # Remove GConf dependency
  patch -Np1 -i ../drop-gconf.patch

  patch -Np1 -i ../migrate-sslpolicyerrors.patch

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
