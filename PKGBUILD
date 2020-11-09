# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinflatplus
pkgver=0.6.0.r14.g930c7dbf
_gitver=930c7dbff222627edb01169c9616fe7f01828cc4
_vdrapi=2.4.3
pkgrel=1
pkgdesc="Simple and slim skin for VDR"
url="http://projects.vdr-developer.org/projects/plg-skinflatplus"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('fontconfig' 'graphicsmagick' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/skin-flatplus.git#commit=$_gitver"
        "$pkgname-graphicsmagick-1.3.32-compat.patch"
        "50-$_plugname.conf")
backup=('etc/epgd/eventsview-flatplus.sql'
        "etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/skinflatplus/configs/'{MV_default,default,fnu_default})
sha256sums=('SKIP'
            '55ee7dfcb59bdf3ea19703a3c0bbeddf17e3bb3b3233c9774a323fdc2045a522'
            '6f6f9699cbc73d73d34c4e17183d3f03b1553a2b8caa62ee881354f2ac12bd8d')

pkgver() {
  cd "$srcdir/skin-flatplus"
  _last_release=0.6.0
  _last_release_commit=cd60fe82b3c0dd03b92b10cdc3135a0ef57f835a

  _count=$((`git rev-list --count HEAD` - `git rev-list --count $_last_release_commit`))
  if [ $_count -gt 0 ]; then
    printf "%s.r%s.g%s" $_last_release \
      $_count \
      `git rev-parse --short HEAD`
  else
    printf "%s" $_last_release
  fi
}

prepare() {
  cd "$srcdir/skin-flatplus"
  patch -p1 -i ${srcdir}/${pkgname}-graphicsmagick-1.3.32-compat.patch
  sed -i 's/Magick++/GraphicsMagick++/g' Makefile
}

build() {
  cd "$srcdir/skin-flatplus"
  make
}

package() {
  cd "$srcdir/skin-flatplus"

  make DESTDIR="$pkgdir" install

  install -Dm644 contrib/eventsview-flatplus.sql "$pkgdir/etc/epgd/eventsview-flatplus.sql"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
  rm "$pkgdir/var/lib/vdr/plugins/skinflatplus/configs/skin flat"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
