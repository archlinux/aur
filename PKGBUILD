# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Doehni <dohny@gmx.de>

pkgname=gnome-do
pkgver=0.95.3
pkgrel=6
pkgdesc="Quickly search for many items present on your desktop or the web, and perform useful actions on those items"
arch=('x86_64')
url="https://do.cooperteam.net/"
license=('GPL3')
depends=('gconf-sharp' 'gnome-keyring-sharp' 'mono-addins' 'notify-sharp' 'gkeyfile-sharp')
makedepends=('intltool' 'gio-sharp')
source=(https://launchpad.net/do/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz{,.asc}
        fix-build.patch
        03_dbus_sharp_2.diff
        drop-gnome-destkop.patch)
validpgpkeys=('972401D296309DE91E713C6F18B3F50FE5923C18') # Christopher James Halse Rogers
sha256sums=('282343285c818f2bb8198e7876f9ec895327415c8ddadc20c299fbe2c8deedfb'
            'SKIP'
            'f5206a5d5cf86c72e713dbdca69a95969c71789c03a1b7a5c685cd60c0e97ad7'
            'ef839c281fe1b3c9b8624b48cdd7ae9b240e7284c03a4852708db686a573ebfa'
            '5ab8f6c342a4f291356d9bf94cc8678ba8a4b3e71b596be2cef6024da8db55f8')

prepare() {
  cd $pkgname-$pkgver

  # Fix build
  patch -Np1 -i ../fix-build.patch

  # Use dbus-sharp-2
  patch -Np1 -i ../03_dbus_sharp_2.diff

  # Remove gnome-desktop2 dependency
  patch -Np1 -i ../drop-gnome-destkop.patch

  # <Super>space is already mapped in GNOME, use <Control>space instead by default (similar to kupfer)
  sed -i 's/&lt;Super&gt;space/&lt;Control&gt;space/' data/gnome-do.schemas.in
  sed -i 's/<Super>space/<Control>space/' Do/src/CorePreferences.cs Do/src/Do.Core/Controller.cs

  # Disable broken network service
  sed -i '/Do.Platform.Linux.NetworkService/d' Do.Platform.Linux/Resources/Do.Platform.Linux.addin.xml

  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
              --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # Don't install autostart file system-wide
  rm -r "$pkgdir"/etc
}
