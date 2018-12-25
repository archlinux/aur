# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-gamepad
pkgver=0.0.1
_vdrapi=2.4.0
pkgrel=16
pkgdesc="Control VDR via a joystick device."
url="http://projects.vdr-developer.org/projects/plg-gamepad"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1562/vdr-plugin-$_plugname-$pkgver.tgz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname/keymap.txt")
md5sums=('dc9112ec8bd40c042bf1a10ba4ecba5e')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  sed -i '1s/^/#include <ctype.h>\n/' gamepad_process_keys_thread.c
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
