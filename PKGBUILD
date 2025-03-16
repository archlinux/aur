# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Ole Ernst <olebowle[at]gmx[dot]com
pkgbase=vdr-streamdev
pkgname=(vdr-streamdev-{client,server})
pkgver=0.6.4
_vdrapi=6
pkgrel=2
pkgdesc="Implementation of the VTP (Video Transfer Protocol)"
url="https://github.com/vdr-projects/vdr-plugin-streamdev"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgbase//vdr-/}
source=("$pkgbase-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-streamdev/archive/refs/tags/$pkgver.tar.gz"
        "50-$_plugname-server.conf")

sha256sums=('1698afccb5fde1ea4e40794ae187fa42ce7fc38af48c12ecd3fa1d3154c6c794'
            'cec0056ca0f140f773f443396ea5f95632f077c4a653a4c5b753ec4937ca3e72')

build() {
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make -j1
}

package_vdr-streamdev-client() {
  pkgdesc+=': client-side'
  replaces=('vdr-streamdev')
  conflicts=('vdr-streamdev')
  backup=("etc/vdr/conf.avail/50-$_plugname-client.conf")
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install-client

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname-client]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname-client.conf"
}

package_vdr-streamdev-server() {
  pkgdesc+=': server-side'
  replaces=('vdr-streamdev')
  conflicts=('vdr-streamdev')
  backup=("etc/vdr/conf.avail/50-$_plugname-server.conf"
          'var/lib/vdr/plugins/streamdev-server/streamdevhosts.conf')
  cd "${srcdir}/vdr-plugin-$_plugname-$pkgver"
  make DESTDIR="$pkgdir" install-server

  install -Dm644 streamdev-server/streamdevhosts.conf "$pkgdir/var/lib/vdr/plugins/streamdev-server/streamdevhosts.conf"
  chown -R 666:666 "$pkgdir/var/lib/vdr"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  install -Dm644 "$srcdir/50-$_plugname-server.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname-server.conf"
}
