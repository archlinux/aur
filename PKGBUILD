# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mldonkey-noframepointers-git
pkgver=3.2.1.r14.g0d446356
pkgrel=3
# Not enabling '--enable-frame-pointers' in the ocaml4 configure is required for aarch64 compilation, not for x86_64. This is why all the '-noframepointers' packages exist.
pkgdesc='A multi-network P2P client. Patched for x86_64/aarch64 and no ocaml4 frame-pointers.'
arch=(x86_64 aarch64)
url="https://github.com/ygrek/mldonkey"
license=(GPL-2.0-or-later)
depends=(file gd hicolor-icon-theme libnatpmp miniupnpc crypto++ libminiupnpc.so)
# All OCaml build deps swapped to -noframepointers
makedepends=(
  git
  gtk2
  librsvg
  ocaml4-noframepointers
  ocaml4-camlp4-noframepointers
  ocaml4-lablgtk2-noframepointers
  ocaml4-num-noframepointers
  wget
)
optdepends=('librsvg: GUI support'
            'gtk2: GUI support')
backup=(etc/conf.d/mldonkey)
provides=("mldonkey=${pkgver}" "mldonkey-git=${pkgver}")
conflicts=(mldonkey mldonkey-git)
options=(!lto)
source=("git+https://github.com/ygrek/mldonkey.git"
        mldonkey.conf
        mldonkey.service
        mldonkey.tmpfiles
        mldonkey.sysusers)
sha256sums=('SKIP'
            'f1d9401cefd591662d49011c53fdb2788755a6f745a963e46d8037b990edeb6a'
            '778cebe8edcffd63db3594054c2daa62ce571644a96ad235b8c95470b55c0415'
            '9c78fbfbba4f8286e2c2299e4da6f76d0f34f33fde26964922707c34fb75157b'
            '24d7ef8f6af93a8d87a82842b0ed796e35ce2f88d81734d9275eede8f4e10fba')

pkgver() {
  cd "mldonkey"
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" -std=gnu17"

  cd "mldonkey"
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
  cd "mldonkey"
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
