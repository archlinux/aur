# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-lcdproc
pkgver=0.0.10_jw9_9_g0c54897
_gitver=0c548975b2d66d860180c79d58235a8923641a0c
_vdrapi=2.6.3
pkgrel=12
pkgdesc="Output to LCD modules that are supported by LCDproc"
url='https://github.com/vdr-projects/vdr-plugin-lcdproc'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
makedepends=('git')
optdepends=('lcdproc: to use local displays')
_plugname=${pkgname//vdr-/}
source=("git+https://github.com/vdr-projects/vdr-plugin-${_plugname}.git#commit=${_gitver}"
        "$pkgname-vdr-2.3.2.patch"
        "50-$_plugname.conf"
        '92-lcdproc.rules')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         'ea362bce385ace4e11828702ed5bf509'
         '0221e0b8878d56e3a057ac37a9c853cf'
         '67d1e0de8e90e0d4e9e977ddfd952442')

prepare() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  patch -p1 -i "$srcdir/$pkgname-vdr-2.3.2.patch"
}

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git describe --tags --abbrev=7 | sed 's/-/_/g;s/v.//'
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/92-lcdproc.rules" "$pkgdir/usr/lib/udev/rules.d/92-lcdproc.rules"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
