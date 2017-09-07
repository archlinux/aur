pkgname=vgmstream-kode54-git
pkgver=r1020.r770.g00e1a5f
pkgrel=1
pkgdesc="Library for playback of various streamed audio formats used in video games (kode54's fork)"
arch=(i686 x86_64)
url='https://gitlab.kode54.net/kode54/vgmstream'
license=(BSD)
depends=(glibc libogg libvorbis mpg123 ffmpeg)
makedepends=(git)
source=(${pkgname}::git+https://gitlab.kode54.net/kode54/vgmstream.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"

  # We won't build the Audacious plugin so we don't need the libraries either.
  sed -i '/PKG_CHECK_MODULES(\(AUDACIOUS\|GTK\)/{N;N;d}' configure.ac
}

build() {
  cd "$srcdir/$pkgname"
  ./bootstrap
  CFLAGS="$CFLAGS -DVGM_USE_FFMPEG" LIBS="-lavcodec -lavformat -lavutil" ./configure
  cd src
  make -f Makefile.audacious
  "${CC-cc}" "$CFLAGS" -lvorbisfile -lmpg123 -lavcodec -lavformat -lavutil -shared -o .libs/libvgmstream.so .libs/*.o */.libs/*.o ../ext_libs/.libs/*.o
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 -t "$pkgdir/usr/include" ext_includes/clHCA.h
  install -D -m644 -t "$pkgdir/usr/include/vgmstream" src/{vgmstream,stream{file,types},util}.h
  install -D -m644 -t "$pkgdir/usr/include/vgmstream/coding" src/coding/{{acm,nwa}_decoder,g72x_state}.h
  install -D -m644 -t "$pkgdir/usr/lib" src/.libs/libvgmstream.{a,so}
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}

# vim:set sw=2 et:
