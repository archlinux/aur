# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinenigmang
pkgver=0.1.2_20_g995b108
epoch=1
_gitver=995b108c894970306efcba1d8e70ded50e76f1d3
_vdrapi=2.4.0
pkgrel=1
pkgdesc="skin based on the Enigma text2skin addon"
url="http://andreas.vdr-developer.org/enigmang/index.html"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('freetype2' 'gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+https://projects.vdr-developer.org/git/vdr-plugin-skinenigmang.git#commit=$_gitver"
        'skinenigmang-search_for_logos_in_resourcedir.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '6bfd86e7a92d969edd208401b65b20fe'
         '8b2c4d67273e3b52e38496e52b35e345')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  patch -p1 -i "$srcdir/skinenigmang-search_for_logos_in_resourcedir.diff"
  sed -i 's/\/include\/freetype/\/include\/freetype2/g' Makefile
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"

  mkdir -p "$pkgdir/$(pkg-config vdr --variable=libdir)"
  make CFLAGS="$(pkg-config vdr --variable=cflags)" \
       CXXFLAGS="$(pkg-config vdr --variable=cxxflags)" \
       VDRDIR="/usr/include/vdr" \
       LIBDIR="$pkgdir/$(pkg-config vdr --variable=libdir)" \
       LOCALEDIR="$pkgdir/$(pkg-config vdr --variable=locdir)" \

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  mkdir -p "$pkgdir/var/lib/vdr/themes"
  cp themes/* "$pkgdir/var/lib/vdr/themes"
  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
