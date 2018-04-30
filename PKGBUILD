# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-tvguideng
pkgver=0.3.0
_vdrapi=2.4.0
pkgrel=3
pkgdesc="highly customizable 2D EPG viewer plugin."
url="http://projects.vdr-developer.org/projects/plg-tvguideng"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=("vdr-api=$_vdrapi" 'vdr-skindesigner')
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/git/vdr-plugin-$_plugname.git/snapshot/vdr-plugin-$_plugname-$pkgver.tar.bz2"
        "tvguideng_235.diff::https://www.vdr-portal.de/index.php?attachment/41876-tvguideng-235-diff/"
        'tvguideng-fix-compile-error.diff')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('dd810a231a1718444d4f02180ae39bb5'
         'ed7610ee07ab3b44420135f6da77f382'
         '1c89a7ec96785eb223ec02f2ad4963f5')

prepare() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  patch -p1 -i "$srcdir/tvguideng-fix-compile-error.diff"
  patch -p1 -i "$srcdir/tvguideng_235.diff"
}

build() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "$srcdir/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
