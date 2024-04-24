# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=vdr-robotv
pkgver=0.15.0
_vdrapi=2.6.7
pkgrel=3
pkgdesc="VDR server plugin for roboTV"
url="https://github.com/pipelka/vdr-plugin-robotv"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('zlib' 'gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/pipelka/vdr-plugin-robotv/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-fix-install-conf.patch::https://patch-diff.githubusercontent.com/raw/pipelka/vdr-plugin-robotv/pull/18.patch")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/robotv/allowed_hosts.conf'
        'var/lib/vdr/plugins/robotv/robotv.conf')
sha256sums=('96ca5136ec8d82e4f8100889f3099f677dffdd0e85a1239d623c66420114dd36'
            '2d74014af6268be0d31c7ffa425e8101eb45db32086c9a1c029a77dca1280030')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  patch -p1 -i "$srcdir/$pkgname-fix-install-conf.patch"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-conf

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
