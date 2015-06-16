# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-imonlcd
pkgver=1.0.1
epoch=1
_vdrapi=2.2.0
pkgrel=19
pkgdesc="shows information about the current state of VDR on iMON LCD"
url="http://projects.vdr-developer.org/projects/show/plg-imonlcd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL3')
depends=('freetype2' 'gcc-libs' "vdr-api=$_vdrapi")
optdepends=()
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/1327/$pkgname-$pkgver.tgz"
        'imonlcd-linker_fix.diff::http://projects.vdr-developer.org/git/vdr-plugin-imonlcd.git/patch/?id=fa47d6df0902d3ac1e4f326be4f2e578fd0f5f19'
        'imonlcd-fix_replay_time.diff::http://projects.vdr-developer.org/git/vdr-plugin-imonlcd.git/patch/?id=4f8c014e73e9ba11172d6070d8a123f9da20361f'
        '92-imonlcd.rules'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('a7f2d49355758d2ccc33ea21dbadc3de'
         '260e88452dda6327d532ee61d5c3c45e'
         'bf67023030f3d5547441e41a709bc7e0'
         '4f012281b8a7025e99067e9945aabda0'
         'bdd88de7c03a24e7a42573b40ed7da32')

prepare() {
  cd "$srcdir/$_plugname-$pkgver"
  patch -p1 -i "$srcdir/imonlcd-linker_fix.diff"
  patch -p1 -i "$srcdir/imonlcd-fix_replay_time.diff"
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
