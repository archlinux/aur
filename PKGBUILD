# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-dbus2vdr
pkgver=31
pkgrel=2
_vdrapi=2.4.0
pkgdesc="Expose some methods via DBus to control the vdr"
url="https://github.com/flensrocker/vdr-plugin-dbus2vdr"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('dbus' 'gcc-libs' 'glib2' 'libpng' "vdr-api=${_vdrapi}")
makedepends=('png++')
backup=('etc/dbus-1/system.d/de.tvdr.vdr.conf')
_plugname=${pkgname//vdr-/}
source=("https://github.com/flensrocker/vdr-plugin-dbus2vdr/archive/v$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=('etc/dbus-1/system.d/de.tvdr.vdr.conf'
        "etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname/network.conf")
md5sums=('d3663d2521b28968cb37fcfeecb1c24b'
         '52f40de6d5a5ca72528f5d65f573ccd2')

build() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm755 "$pkgdir/usr/share/vdr-plugin-$_plugname/vdr-dbus-send.sh" \
    "$pkgdir/usr/bin/vdr-dbus-send"

  rm -r "$pkgdir/usr/share/vdr-plugin-$_plugname"
  rm -r "$pkgdir/etc/init"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
