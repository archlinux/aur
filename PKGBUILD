# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-targavfd
pkgver=0.3.2
epoch=1
_vdrapi=2.6.3
pkgrel=4
pkgdesc="Shows information about the current state of VDR on Targa USB Graphic Vacuum Fluorescent Display"
url="https://github.com/vdr-projects/vdr-plugin-targavfd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libusb' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-targavfd/archive/refs/tags/$pkgver.tar.gz"
        '92-targavfd.rules')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('1fae0afa633fa83632f2cfb82376614355a686a59740eaa9173c82faeb84673b'
            '01806805d602c4e97fed9318bd0d2c2f1d6ea92bf241a702bb086c7ebd0d5e99')

build() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/92-targavfd.rules" "$pkgdir/usr/lib/udev/rules.d/92-targavfd.rules"

  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  cp contrib/*.ttf "$pkgdir/usr/share/fonts/TTF"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
