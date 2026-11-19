# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=sylpheed-qtify
pkgver=3.7.0
pkgrel=1
pkgdesc="Sylpheed, the GTK 2 mail client, built on Qt with GTK made Qt"
arch=(x86_64 aarch64)
url="https://sylpheed.sraoss.jp/"
license=(GPL-2.0-or-later LGPL-2.1-or-later)
depends=(gtk-made-qt glib2 cairo pango openssl)
makedepends=(pkgconf)
provides=(sylpheed)
conflicts=(sylpheed)
# Debian's copy of the release tarball
source=("https://deb.debian.org/debian/pool/main/s/sylpheed/sylpheed_${pkgver}.orig.tar.bz2")
sha256sums=('3e6ac156fa1f7c7b3a4e8a5b077488c77b49374318575bb9e32ae13b3655cbe7')

build() {
  cd "sylpheed-${pkgver}"
  # the shared toolkit: the plugin library calls GTK too;
  # GCC 14 makes libsylph's pointer type mismatches (execute_async) errors
  CFLAGS+=" -Wno-error=incompatible-pointer-types"
  gtk-made-qt-env --shared ./configure --prefix=/usr --disable-gtkspell --disable-gpgme \
    --disable-compface --disable-rpath
  gtk-made-qt-env --shared make
}

check() {
  cd "sylpheed-${pkgver}"
  # starts headless in an empty home (the first run dialog) and quits
  mkdir -p "$srcdir/home"
  HOME="$srcdir/home" LANG=C.UTF-8 QT_QPA_PLATFORM=offscreen GTKQT_AUTOQUIT=2000 ./src/sylpheed
}

package() {
  cd "sylpheed-${pkgver}"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '*.la' -delete
}
