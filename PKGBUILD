# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-dvbapi
pkgver=2.2.4_4_g7d51cc4
epoch=1
_gitver=7d51cc457823156d446d06c6ae40f850958fa735
_vdrapi=2.4.0
pkgrel=1
pkgdesc="A bridge between VDR and OScam."
url="https://github.com/manio/vdr-plugin-dvbapi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'libdvbcsa' 'openssl' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git+${url}.git#commit=${_gitver}")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --tags | sed 's/-/_/g;s/v//'
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  sed -i 's/ -fdiagnostics-color=auto//g' Makefile
  make LIBDVBCSA=1
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make LIBDVBCSA=1 DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
