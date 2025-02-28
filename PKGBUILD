# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=libwebp0.5
pkgver=0.5.2
pkgrel=2
pkgdesc="WebP library and conversion tools"
arch=(x86_64)
url="https://developers.google.com/speed/webp/"
license=(BSD)
depends=(libpng libjpeg-turbo libtiff giflib)
makedepends=(freeglut mesa glu)
provides=(libwebp.so libwebpdecoder.so libwebpmux.so libwebpdemux.so)
optdepends=('freeglut: vwebp viewer')
source=("https://github.com/webmproject/libwebp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e6555d982adc9a6397031a2545b69d0a38b5fb63b7e7a51727ec3efa93ca0575')

prepare() {
  cd "$srcdir/libwebp-$pkgver"
}

build() {
  cd "$srcdir/libwebp-$pkgver"

  sh autogen.sh
  ./configure --prefix=/usr \
     --enable-swap-16bit-csp \
     --enable-experimental \
     --enable-libwebp{mux,demux,decoder} \
     --disable-static
  make
}

package() {
  cd "$srcdir/libwebp-$pkgver"

  make install DESTDIR="$pkgdir"
  # Remove unneeded files so that only the shared library remains
  rm -rf "${pkgdir}"/usr/{bin,include,lib/{libwebp{mux,demux,decoder,}.{a,so},pkgconfig},share}
  # HACK: system libwebp provides libwebpdemux.so.2? we don't
  [[ -f /usr/lib/libwebpdemux.so.2 ]] && rm "${pkgdir}"/usr/lib/libwebpdemux.so.2
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
