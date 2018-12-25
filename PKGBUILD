# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-sleeptimer
pkgver=0.8.2
_vdrapi=2.4.0
pkgrel=22
pkgdesc="Shutdown, mute or execute a custom command after a configurable timespan"
url="http://projects.vdr-developer.org/projects/plg-sleeptimer"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://projects.vdr-developer.org/attachments/download/652/vdr-plugin-$_plugname-$pkgver.tgz"
        "$pkgname-Makefile::http://projects.vdr-developer.org/git/vdr-plugin-sleeptimer.git/plain/Makefile"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('cd7012d58d1350a6dc5597dd50a2cd40'
         '6045e319c4dc47bc877ae6f331db8049'
         '7ac2bda3d2a6238e815a6b04bccf4a81')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  cp "$srcdir/$pkgname-Makefile" Makefile
  sed -i 's/i18n\.o//g' Makefile
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
