# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-imonlcd
pkgver=1.0.2
epoch=1
_vdrapi=2.4.0
pkgrel=3
pkgdesc="shows information about the current state of VDR on iMON LCD"
url="http://projects.vdr-developer.org/projects/show/plg-imonlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('freetype2' 'gcc-libs' "vdr-api=$_vdrapi")
optdepends=()
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/2086/$pkgname-$pkgver.tgz"
        "Fix-release_every-lock-schedules.diff::https://projects.vdr-developer.org/git/vdr-plugin-imonlcd.git/patch/?id=6a03b80df7f18ebb06f160fbe1d2ef3061c4b97a"
        "imonlcd-freetype-2.9.1-fix.diff"
        '92-imonlcd.rules'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('e3155d98e5a0c461dd66b7b89e1880ec'
         '0d73b1bb117f51d881a13f39ac31f1e6'
         '689cbd832a2a9c829aaf6149d757b1b5'
         '4f012281b8a7025e99067e9945aabda0'
         'bdd88de7c03a24e7a42573b40ed7da32')

prepare() {
  cd "$srcdir/$_plugname-$pkgver"
  patch -p1 -i "${srcdir}/Fix-release_every-lock-schedules.diff"
  patch -p1 -i "${srcdir}/imonlcd-freetype-2.9.1-fix.diff"
}

build() {
  cd "$srcdir/$_plugname-$pkgver"
  make
}
package() {
  cd "$srcdir/$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/92-imonlcd.rules" "$pkgdir/usr/lib/udev/rules.d/92-imonlcd.rules"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
