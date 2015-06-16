# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-play
pkgver=0.0.14_21_g8035264
_gitver=8035264d471f75407222a48f2fa707795e25d461
_vdrapi=2.2.0
pkgrel=13
pkgdesc="Mediaplayer plugin for VDR and X11"
url="http://projects.vdr-developer.org/projects/plg-play"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('AGPL3')
depends=('mplayer' "vdr-api=${_vdrapi}" 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-wm')
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-play.git#commit=$_gitver"
        'play-vdr2.1.10compat.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '88bd08bead28aab75bd002daccf7e5b5'
         '19d455b69728f7e6469763b2b2424074')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git tag -a 0.0.14 -m 'Added Tag' eb4b8437553ff7666eceadd09c6cb9dd8255380e 2> /dev/null
  git describe --tags | sed 's/-/_/g'
}

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  patch -p1 -i "$srcdir/play-vdr2.1.10compat.diff"
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
