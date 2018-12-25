# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-xmltv2vdr
pkgver=0.1.1_74_gec7bd92
_gitver=ec7bd920d94e55f2d21bfa076b7e900b7b2b7537
_vdrapi=2.4.0
pkgrel=2
pkgdesc="Add epg info from epg sources into vdr"
url="http://projects.vdr-developer.org/projects/plg-xmltv2vdr"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('pcre' 'curl' 'enca' 'libxslt' 'libzip' 'sqlite' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-xmltv2vdr.git#commit=$_gitver"
        "xmltv2vdr_newmakefile_v2.diff"
        "xmltv2vdr_gcc721_fixes.diff"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/epgsources/epgdata2xmltv")
md5sums=('SKIP'
         '0642898237a478d4c74bceb568c50050'
         'ebcdb9f3a9537fdaae15782e7648c026'
         'e295ea355768bd373f64eb4b0f760840')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  patch -p1 -i "$srcdir/xmltv2vdr_newmakefile_v2.diff"
  patch -p1 -i "$srcdir/xmltv2vdr_gcc721_fixes.diff"
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make
  make -j1 -C dist/epgdata2xmltv
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C dist/epgdata2xmltv

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  mkdir -p "$pkgdir/var/lib/epgsources/epgdata2xmltv-img"
  chown -R 666:666 "$pkgdir/var/lib/epgsources"

  mkdir -p "$pkgdir/var/cache/vdr/epgimages"
  chown -R 666:666 "$pkgdir/var/cache/vdr"
}
