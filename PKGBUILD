# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-amlhddevice
pkgver=0
_gitver=3620e2eebc6df1c86a6a5bb291f11ddf2b1caac8
_vdrapi=2.2.0
pkgrel=1
pkgdesc="Output device for Amlogic SOCs"
url="http://projects.vdr-developer.org/projects/plg-amlhddevice"
arch=('armv7h')
license=('GPL2')
depends=('aml-libs-c1' 'ffmpeg' 'mesa' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-amlhddevice.git#commit=$_gitver"
        "amldevice_arch_compat.diff"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         'b727e72154fe4fcb6c1f037fa90d4dcc'
         'c613f659043adf5ff3a7efa2388f5859')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git tag 'v0' 3620e2eebc6df1c86a6a5bb291f11ddf2b1caac8
  git describe --tags | sed 's/-/_/g;s/v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  patch -p1 -i "$srcdir/amldevice_arch_compat.diff"
}


build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
