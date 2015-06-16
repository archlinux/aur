# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-text2skin
pkgver=1.3.2_11_g7bd88a0
_gitver=7bd88a078d31f57e8fcfc0b93c45c3e8b13c5190
_vdrapi=2.2.0
pkgrel=23
pkgdesc="VDR Text2Skin Plugin"
url="http://projects.vdr-developer.org/projects/plg-text2skin"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('graphicsmagick' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-text2skin.git#commit=$_gitver"
        'text2skin-vdr2.1.2compat.diff'
        'patch-1' 'patch-2' 'patch-3' 'patch-4'
        'static-std-string.diff')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         '5615fceb3b7597405402d1b817f8bc22'
         '7ec3aae93025ed5608daf5c81dfcc234'
         '717775474393c3724f5c14ebca76ca7d'
         '5a747b0e163790fa63d226be175985d9'
         'b8a5f802acbfc062b381cbcda2fba08d'
         '54b2e7002138bbacea52cc149387a710')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  patch -p1 -i "$srcdir/text2skin-vdr2.1.2compat.diff"
  patch -p1 -i "$srcdir/patch-1"
  patch -p1 -i "$srcdir/patch-2"
  patch -p1 -i "$srcdir/patch-3"
  patch -p1 -i "$srcdir/patch-4"
  patch -p1 -i "$srcdir/static-std-string.diff"
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
