# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-targavfd
pkgver=0.3.0
_gitver=dda51eecf59675024160018fa94a828cea1d7404
epoch=1
_vdrapi=2.2.0
pkgrel=7
pkgdesc="shows information about the current state of VDR on Targa USB Graphic Vacuum Fluorescent Display"
url="http://projects.vdr-developer.org/projects/show/plg-targavfd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('freetype2' 'libusbx' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-targavfd.git#commit=$_gitver"
        '92-targavfd.rules')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         'ee53f6e044af746a1e518937edc9a341')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/92-targavfd.rules" "$pkgdir/usr/lib/udev/rules.d/92-targavfd.rules"

  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  cp contrib/*.ttf "$pkgdir/usr/share/fonts/TTF"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
