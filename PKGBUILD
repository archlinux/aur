# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=ashuffle
pkgver=2.0.1
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd."
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient")
makedepends=("meson")

source=(
  "https://github.com/joshkunz/ashuffle/archive/v${pkgver}/ashuffle-${pkgver}.tar.gz"
  "https://github.com/zorgnax/libtap/raw/14e6708db5215a657e615171682a1741023c9c0c/tap.c"
  "https://github.com/zorgnax/libtap/raw/14e6708db5215a657e615171682a1741023c9c0c/tap.h"
)
sha256sums=(
  "7b1ce117568de33e26bcc762c0fba8c1a487952d93668358d10ae0dd52d5c487"
  "5952a5c99a273cc630eeb773461e5ee8255b3ddd19a9051f189e0ab1c1b7eaa8"
  "063dbe4bbd0c93707b31f536b54c698d30793be3410f428f0647aeb859c267c9"
)


build() {
  cd "ashuffle-${pkgver}"

  mkdir -p t/libtap
  cp -a "$srcdir/tap.c" "$srcdir/tap.h" t/libtap/

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
