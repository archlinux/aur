# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-live
pkgver=2.3.1
epoch=1
_gitver=e582514ede475574842b44ca6792335ff141172d
_vdrapi=2.4.0
pkgrel=2
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
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '563961eb90d9f2b3d2a0a34472ef51ee')

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
