# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-live
pkgver=2.3.1
epoch=1
_gitver=e582514ede475574842b44ca6792335ff141172d
_vdrapi=2.4.6
pkgrel=6
pkgdesc="Adds the possibility to control VDR and some of it's plugins by a web interface."
url="http://projects.vdr-developer.org/projects/plg-live"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('pcre' 'tntnet' "vdr-api=${_vdrapi}")
optdepends=('vdr-epgsearch: Manage searchtimers'
            'vdr-streamdev: Stream live TV')
makedepends=('git' 'patchutils')
install="$pkgname.install"
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-live.git#commit=$_gitver"
        'https://projects.vdr-developer.org/attachments/download/2186/v2-0004-Add-ability-to-play-stream-by-external-media-player.patch'
        'https://projects.vdr-developer.org/attachments/download/2187/0005-Remove-support-for-VLC-NPAPI-plugin-and-replace-it-w.patch'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '14152d6ddc14d5ec39473f92ca1c1f78'
         'ea8187d1e51fbc1a48767ac6eb0f33d2'
         '563961eb90d9f2b3d2a0a34472ef51ee')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  filterdiff -x '*.po' ${srcdir}/v2-0004-Add-ability-to-play-stream-by-external-media-player.patch | git apply -
  filterdiff -x '*.po' ${srcdir}/0005-Remove-support-for-VLC-NPAPI-plugin-and-replace-it-w.patch | git apply -
}

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed -e 's/release_//g' -e 's/-/\./' -e 's/-/\./' -e 's/-/_/g'
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
