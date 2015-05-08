pkgname=vgmstream-kode54-git
pkgver=r1020.r90.gd84b770
pkgrel=1
pkgdesc="Library for playback of various streamed audio formats used in video games (kode54's fork)"
arch=(i686 x86_64)
url='https://github.com/kode54/vgmstream'
license=(BSD)
depends=(glibc libogg libvorbis mpg123)
makedepends=(git)
source=(${pkgname}::git+https://github.com/kode54/vgmstream.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  # We won't build the Audacious plugin so we don't need the libraries either.
  sed -i '/PKG_CHECK_MODULES(\(AUDACIOUS\|GTK\)/{N;N;d}' configure.in
  ./bootstrap
  ./configure
  cd src
  make -f Makefile.unix
  "${CC-cc}" "$CFLAGS" -lvorbisfile -lmpg123 -shared -o .libs/libvgmstream.so .libs/*.o */.libs/*.o
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 -t "$pkgdir/usr/include/vgmstream" src/{vgmstream,stream{file,types},util}.h
  install -D -m644 -t "$pkgdir/usr/include/vgmstream/coding" src/coding/{{acm,nwa}_decoder,g72x_state}.h
  install -D -m644 -t "$pkgdir/usr/lib" src/.libs/libvgmstream.{a,so}
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}

# vim:set sw=2 et:
