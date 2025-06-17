# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mldonkey
pkgver=3.2.1
pkgrel=5
pkgdesc='A multi-network P2P client'
arch=(x86_64)
url="https://github.com/ygrek/mldonkey"
license=(GPL-2.0-or-later)
depends=(file gd hicolor-icon-theme libnatpmp miniupnpc
         libminiupnpc.so)
makedepends=(gtk2 librsvg ocaml4 ocaml4-camlp4 ocaml4-lablgtk2 ocaml4-num wget)
optdepends=('librsvg: GUI support'
            'gtk2: GUI support'
            'gtk-engine-murrine: optional theme engine')
backup=(etc/conf.d/mldonkey)
source=("https://github.com/ygrek/mldonkey/releases/download/release-${pkgver//./-}/mldonkey-${pkgver}.tar.bz2"
        mldonkey.conf
        mldonkey.service
        mldonkey.tmpfiles
        mldonkey.sysusers)
sha256sums=('9c0be397ab2193256f52f7bafaf210bf29c93bb4758bb1818f4633763b996bc7'
            'f1d9401cefd591662d49011c53fdb2788755a6f745a963e46d8037b990edeb6a'
            '778cebe8edcffd63db3594054c2daa62ce571644a96ad235b8c95470b55c0415'
            '9c78fbfbba4f8286e2c2299e4da6f76d0f34f33fde26964922707c34fb75157b'
            '24d7ef8f6af93a8d87a82842b0ed796e35ce2f88d81734d9275eede8f4e10fba')

# {,.asc}
# FAILED (the public key A34C49DD3DB8B78DFAEBE0FA6346B945708D5A0C is not trusted)

build() {
  export CFLAGS+=" -std=gnu17"

  cd "mldonkey-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-gui=newgui2 \
    --enable-upnp-natpmp \
    --disable-fasttrack \
    --disable-gnutella \
    --disable-gnutella2

  make
  make utils
}

package() {
  cd "mldonkey-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 packages/rpm/mldonkey-icon-16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/mldonkey.png
  install -Dm644 packages/rpm/mldonkey-icon-32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/mldonkey.png
  install -Dm644 packages/rpm/mldonkey-icon-48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/mldonkey.png
  install -Dm644 distrib/mldonkey.desktop "$pkgdir"/usr/share/applications/mldonkey.desktop

  install -Dm644 "$srcdir"/mldonkey.conf "$pkgdir"/etc/conf.d/mldonkey
  install -Dm644 "$srcdir"/mldonkey.service "$pkgdir"/usr/lib/systemd/system/mldonkey.service
  install -Dm644 "$srcdir"/mldonkey.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/mldonkey.conf
  install -Dm644 "$srcdir"/mldonkey.sysusers "$pkgdir"/usr/lib/sysusers.d/mldonkey.conf
}
