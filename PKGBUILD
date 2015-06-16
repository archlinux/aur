# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-dvbapi
pkgver=2.2.0_14_g0489e01
epoch=1
_gitver=0489e0153ce26bfb92524d965c9a8985db69040a
_vdrapi=2.2.0
pkgrel=1
pkgdesc="A bridge between VDR and OScam."
url="https://github.com/manio/vdr-plugin-dvbapi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'libdvbcsa' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://github.com/manio/vdr-plugin-dvbapi.git#commit=$_gitver")
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
