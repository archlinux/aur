# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinflatplus
pkgver=0.6.0.r12.g5a8c1819
_gitver=5a8c1819d963bc78c317b98dd2e77be68bad1549
_vdrapi=2.4.0
pkgrel=1
pkgdesc="Simple and slim skin for VDR"
url="http://projects.vdr-developer.org/projects/plg-skinflatplus"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('fontconfig' 'graphicsmagick' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/skin-flatplus.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=('etc/epgd/eventsview-flatplus.sql'
        "etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/skinflatplus/configs/'{MV_default,default,fnu_default})
md5sums=('SKIP'
         '878594e0f5af2ab308e6ab86a9bf0136')

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
