# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-vnsiserver
pkgver=1.8.2
_vdrapi=2.6.3
epoch=2
pkgrel=1
url="https://github.com/vdr-projects/vdr-plugin-vnsiserver"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="VDR plugin to handle Kodi clients"
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-vnsiserver/archive/refs/tags/$pkgver.tar.gz"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/vnsiserver/allowed_hosts.conf')
sha256sums=('e981ddc7adaa5824707081029a4f4e9990bb633dd612885034973132b4838bec'
            '0e03e0df28b8210e3813536c7945b94e4c13ac775eb2c8d25403f90aa8f3c74c')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/var/lib/vdr/plugins"
  cp -r vnsiserver "$pkgdir/var/lib/vdr/plugins"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
