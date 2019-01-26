# Maintainer: Nimrod Maclomhair <nimrod4garoa@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gnuplot-headless
pkgver=5.2.6
pkgrel=1
pkgdesc="Plotting package which outputs to PostScript, PNG, GIF, and others, without any X or latex depencies." 
arch=('i686' 'x86_64') 
url="http://www.gnuplot.info" 
license=('custom') 
depends=('readline' 'lua' 'ncurses')
makedepends=()
provides=('gnuplot')
conflicts=('gnuplot')
options=('!makeflags')
source=("http://downloads.sourceforge.net/sourceforge/gnuplot/gnuplot-$pkgver.tar.gz"
        "lua53_compat.patch")
sha1sums=('e39a58addf5d69814cd6631a2aff24c5a5206c05'
          '9005fa9e4da91ceedb8ccd1d761866e7b064f8b1')

prepare() {
  cd "${srcdir}/gnuplot-${pkgver}"

  # fix default source location; use the GDFONTPATH variable to modify at runtime
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

  sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
  -e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
  src/variable.c

  patch -p1 < "$srcdir"/lua53_compat.patch
}

build() {
  cd "${srcdir}/gnuplot-${pkgver}"

  # If you want png and jpeg terminal support, set --with-gd and get
  # add "gd-headless" as an depency.
  ./configure --prefix=/usr \
              --libexecdir=/usr/bin \
              --with-gihdir=/usr/share/gnuplot \
              --with-readline=gnu \
              --disable-x11-mbfonts \
              --disable-x11-external \
              --disable-wxwidgets \
              --without-latex \
              --without-cairo \
              --with-qt=no \
              --without-libcerf \
              --disable-raise-console \
              --with-x=no \
              --with-aquaterm=no \
              --with-linux-vga=no \
              --with-ggi=no \
              --with-gd=no

#              --with-bitmap-terminals \

  make pkglibexecdir=/usr/bin
}

package() {
  cd "${srcdir}/gnuplot-${pkgver}"
  make pkglibexecdir=/usr/bin DESTDIR="${pkgdir}" install

  install -Dm644 Copyright "${pkgdir}/usr/share/licenses/$pkgname/Copyright"

  rm -f "${pkgdir}/usr/share/texmf-dist/ls-R"
}
