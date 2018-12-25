# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinpearlhd
pkgver=0.0.1_28_g9899940
_gitver=9899940a4920e77d1d6c14a3b1bb16be47f5045d
_vdrapi=2.4.0
pkgrel=28
pkgdesc="conversion of the PearlHD-Skin written by mapovi to a native vdr-plugin"
url="http://projects.vdr-developer.org/projects/show/plg-skinpearlhd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-skinpearlhd.git#commit=$_gitver"
        'pearlhd-use_graphicsmagick.diff'
        'skinpearlhd-search_for_logos_in_resourcedir.diff'
        'http://projects.vdr-developer.org/attachments/download/1386/setup-page-fix.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '7906df33146a0d65cbf7dcb8d524e07a'
         'a3863c199b78f405a79b46b2e10c9dc9'
         '2a8bfca1077129fbcc0d777075336878'
         'e4ffd0d1adf41aa6e5729ea5132e5616')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"

  # Use GraphicsMagick instead of ImageMagick
  patch -p1 -i "$srcdir/pearlhd-use_graphicsmagick.diff"

  # Bug 1379
  patch -p1 -i "$srcdir/setup-page-fix.diff"

  patch -p1 -i "$srcdir/skinpearlhd-search_for_logos_in_resourcedir.diff"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
