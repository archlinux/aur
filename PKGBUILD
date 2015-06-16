# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-live
pkgver=0.3.0_21_g6ea279a
epoch=1
_gitver=6ea279a74a84b13aa72237448c9ed848c8fdcad4
_vdrapi=2.2.0
pkgrel=1
pkgdesc="Adds the possibility to control VDR and some of it's plugins by a web interface."
url="http://projects.vdr-developer.org/projects/plg-live"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('pcre' 'tntnet' "vdr-api=${_vdrapi}")
optdepends=('vdr-epgsearch: Manage searchtimers'
            'vdr-streamdev: Stream live TV')
makedepends=('git')
install="$pkgname.install"
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-live.git#commit=$_gitver"
        'live-folderstatecookie-v2.diff::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=34407'
        'live-osd-patch_150221.diff::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=37780'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '6abb3d1724057e765e98e1a9b5326fe3'
         'c045e5e6ec376eebee834e6dc178327c'
         '563961eb90d9f2b3d2a0a34472ef51ee')
pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed -e 's/release_//g' -e 's/-/\./' -e 's/-/\./' -e 's/-/_/g'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"

  # Remove some files. Otherwise patch complains with a dirty src dir
  rm -f osd_status.{cpp,h}
  rm -f pages/osd.ecpp

  patch -p1 -i "$srcdir/live-folderstatecookie-v2.diff"
  patch -p1 -i "$srcdir/live-osd-patch_150221.diff"

  # Use the more modern ResourceDirectory in /usr/share instead of /var/lib
  sed -i 's/cPlugin::ConfigDirectory/cPlugin::ResourceDirectory/g' live.cpp
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="$pkgdir" install

  # Copy resource files
  mkdir -p "$pkgdir/usr/share/vdr/plugins"
  cp -r live "$pkgdir/usr/share/vdr/plugins"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
