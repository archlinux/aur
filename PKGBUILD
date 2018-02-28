pkgname=vgmstream-kode54-git
pkgver=r1020.r1169.gc3d3aaee
pkgrel=2
pkgdesc="Library for playback of various streamed audio formats used in video games (kode54's fork)"
arch=(i686 x86_64)
url='https://github.com/kode54/vgmstream'
license=(BSD)
depends=(libogg libvorbis mpg123 ffmpeg)
makedepends=(audacious git)
optdepends=('audacious: to use the bundled plugin')
source=(${pkgname}::git+https://github.com/kode54/vgmstream.git
        install-headers.patch
        no-link-audacious.patch)
sha256sums=('SKIP'
            '8f723536321480bb46b731f66c29a5f5354834094458f93de7539bbe4465b824'
            'bacb229eeea75a6c00761c6c446cc34f25cd7ca938f7b4241f793d036f738554')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p0 < "$srcdir"/install-headers.patch
  patch -p0 < "$srcdir"/no-link-audacious.patch
}

build() {
  cd "$srcdir/$pkgname"
  ./bootstrap
  CFLAGS="$CFLAGS -DVGM_USE_FFMPEG" LIBS="-lavcodec -lavformat -lavutil" ./configure --prefix=/usr
  make -f Makefile.autotools
}

package() {
  cd "$srcdir/$pkgname"
  make -f Makefile.autotools install DESTDIR="$pkgdir"
}

# vim:set sw=2 et:
