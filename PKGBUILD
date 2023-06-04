# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-wirbelscan
pkgver=2023.02.19
_vdrapi=2.6.3
pkgrel=1
pkgdesc="Performs a channel scans for DVB-T, DVB-C and DVB-S"
url="https://www.gen2vdr.de/wirbel/wirbelscan/index2.html"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}" "librepfunc")
_plugname=${pkgname//vdr-/}
source=("https://www.gen2vdr.de/wirbel/wirbelscan/$pkgname-$pkgver.tgz"
        "$pkgname-add_missing_cstdint_h.patch::https://github.com/wirbel-at-vdr-portal/wirbelscan-dev/commit/016c9aee9d12326e3b08ded15ab98ab5c82c7228.patch")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha256sums=('239dbf4e4f93addaed2326895a547d2f6d4d0bcbe6fc0c5a05301789e6cbb9d2'
            'b4dde703cb0c091a0646d85b6a82b58b580989f5bfcf9ac797b183f4654c548b')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/$pkgname-add_missing_cstdint_h.patch"
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
