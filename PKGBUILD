# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-tvguide
pkgver=1.2.2
epoch=1
_vdrapi=2.4.0
pkgrel=12
pkgdesc="highly customizable 2D EPG viewer plugin."
url="http://projects.vdr-developer.org/projects/plg-tvguide"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' 'libpng' "vdr-api=$_vdrapi")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1701/$pkgname-$pkgver.tgz"
        "vdr-2.3.1-tvguide.diff"
        "vdr-2.3.5-tvguide.diff"
        "vdr-2.3.7-tvguide.diff"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('1e811e1a99f68afd8f85f56fd416a0f1'
         '6305ab08f42943032d5d97ab187534ec'
         '6064290c6a522c441aa8a13d3a19d18f'
         '62533445bfdd384d1bd09c4ffb451682'
         '3caf2313b8794eaa525af664a7208b7a')

prepare() {
  cd "$srcdir/$_plugname-$pkgver"
  patch -i "${srcdir}/vdr-2.3.1-tvguide.diff"
  patch -i "${srcdir}/vdr-2.3.5-tvguide.diff"
  patch -i "${srcdir}/vdr-2.3.7-tvguide.diff"
}

build() {
  cd "$srcdir/$_plugname-$pkgver"
  make IMAGELIB=graphicsmagick
}

package() {
  cd "$srcdir/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
