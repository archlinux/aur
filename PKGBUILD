# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinflatplus
pkgver=0.5.1
_gitver=e03133d00c19982f609dc124cee71f1f6b59e32b
_vdrapi=2.2.0
pkgrel=3
pkgdesc="Simple and slim skin for VDR"
url="http://projects.vdr-developer.org/projects/plg-skinflatplus"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' "vdr-api=${_vdrapi}")
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
  git tag -a 0.5.1 -m 'Added Tag' e03133d00c19982f609dc124cee71f1f6b59e32b 2> /dev/null
  git describe --tags | sed 's/-/_/g'
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
