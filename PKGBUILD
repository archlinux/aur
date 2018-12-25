# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-targavfd
pkgver=0.3.1
epoch=1
_vdrapi=2.4.0
pkgrel=2
pkgdesc="shows information about the current state of VDR on Targa USB Graphic Vacuum Fluorescent Display"
url="http://projects.vdr-developer.org/projects/show/plg-targavfd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libusbx' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("https://projects.vdr-developer.org/attachments/download/2087/$pkgname-$pkgver.tgz"
        'targavfd-freetype-2.9.1-fix.diff'
        '92-targavfd.rules')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('ddd4893d206039c6738e7e81d2aac811'
         '7fa986311cba912c95f601e90d36e8b5'
         'ee53f6e044af746a1e518937edc9a341')

prepare() {
  cd "$srcdir/$_plugname-$pkgver"
  patch -p1 -i "${srcdir}/targavfd-freetype-2.9.1-fix.diff"
}

build() {
  cd "$srcdir/$_plugname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/92-targavfd.rules" "$pkgdir/usr/lib/udev/rules.d/92-targavfd.rules"

  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  cp contrib/*.ttf "$pkgdir/usr/share/fonts/TTF"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
