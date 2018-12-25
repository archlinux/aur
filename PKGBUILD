# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-text2skin
pkgver=1.3.4_11_g8f7954d
_gitver=8f7954da2488ced734c30e7c2704b92a44e6e1ad
_vdrapi=2.4.0
pkgrel=1
pkgdesc="VDR Text2Skin Plugin"
url="http://projects.vdr-developer.org/projects/plg-text2skin"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://projects.vdr-developer.org/git/vdr-plugin-text2skin.git#commit=$_gitver")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  sed -i 's/Config/Resource/g' common.c
  sed -i '/^IMAGELIB/d' Makefile
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"

  mkdir -p "$pkgdir/usr/lib/vdr/plugins"
  make CFLAGS="$(pkg-config vdr --variable=cflags)" \
       CXXFLAGS="$(pkg-config vdr --variable=cxxflags)" \
       VDRDIR="/usr/include/vdr" \
       LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
       LOCALEDIR="$pkgdir/$(pkg-config vdr --variable=locdir)" \
       IMAGELIB=graphicsmagick

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
