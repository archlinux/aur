# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-skinenigmang
pkgver=0.1.2_16_g0147c0e
epoch=1
_gitver=0147c0ee6222bd10714ef36f42dcee94495bdb92
_vdrapi=2.2.0
pkgrel=7
pkgdesc="skin based on the Enigma text2skin addon"
url="http://andreas.vdr-developer.org/enigmang/index.html"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-skinenigmang.git#commit=$_gitver"
        "skinenigmang-newmakefile-vdr1.7.36-2.tgz::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=32701"
        'skinenigmang-search_for_logos_in_resourcedir.diff'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '16eec14395fdc008462754e099bf802f'
         '6bfd86e7a92d969edd208401b65b20fe'
         '8b2c4d67273e3b52e38496e52b35e345')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  patch -p1 -i "$srcdir/skinenigmang-search_for_logos_in_resourcedir.diff"
  cp "$srcdir/skinenigmang/Makefile" .
  sed -i '/^HAVE_IMAGEMAGICK/d' Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="$srcdir" install

  mkdir -p "$pkgdir/var/lib/vdr/themes"
  cp themes/* "$pkgdir/var/lib/vdr/themes"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
