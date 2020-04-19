# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=ashuffle
pkgver=2.2.2
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd."
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient")
makedepends=("meson")

source=(
  "https://github.com/joshkunz/ashuffle/archive/v${pkgver}/ashuffle-${pkgver}.tar.gz"
  "tap-14e6.c::https://github.com/zorgnax/libtap/raw/14e6708db5215a657e615171682a1741023c9c0c/tap.c"
  "tap-14e6.h::https://github.com/zorgnax/libtap/raw/14e6708db5215a657e615171682a1741023c9c0c/tap.h"
)
sha256sums=(
  "beec5e08336e70a29ae2a75c6ec4de9b9d0d48abf04b2c66f4db2fdc4e4af1e1"
  "5952a5c99a273cc630eeb773461e5ee8255b3ddd19a9051f189e0ab1c1b7eaa8"
  "063dbe4bbd0c93707b31f536b54c698d30793be3410f428f0647aeb859c267c9"
)


build() {
  cd "ashuffle-${pkgver}"

  mkdir -p t/libtap
  cp -a "$srcdir/tap-14e6.c" t/libtap/tap.c
  cp -a "$srcdir/tap-14e6.h" t/libtap/tap.h

  arch-meson -Dtests=enabled builddir

  ninja -C builddir
}

check() {
  cd "ashuffle-${pkgver}"

  ninja -C builddir test
}

package() {
  cd "ashuffle-${pkgver}"

  DESTDIR="${pkgdir}" ninja -C builddir install

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
