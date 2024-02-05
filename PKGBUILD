# Maintainer: Nimrod Maclomhair <nimrod4garoa@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gnuplot-headless
pkgver=6.0.0
pkgrel=1
pkgdesc='Plotting package which outputs to PostScript, PNG, GIF, and others, without X deps'
arch=('i686' 'x86_64' 'aarch64' 'aarch32') 
url='http://www.gnuplot.info'
license=('custom') 
depends=(gcc-libs
         glibc
         lua
         readline)
makedepends=(texlive-latexextra)
provides=('gnuplot')
conflicts=('gnuplot')
options=('!makeflags')
source=("http://downloads.sourceforge.net/sourceforge/gnuplot/gnuplot-$pkgver.tar.gz"
        "lua53_compat.patch")
sha256sums=('635a28f0993f6ab0d1179e072ad39b8139d07f51237f841d93c6c2ff4b1758ec'
            'bfd8a61abbf4491c74225cb9fd252619d4fc29751838bcb4c0639ffe05a00695')

prepare() {
  cd "${srcdir}/gnuplot-${pkgver}"

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
              --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
              --disable-x11-mbfonts \
              --disable-x11-external \
              --disable-wxwidgets \
              --without-cairo \
              --with-qt=no \
              --without-libcerf \
              --disable-raise-console \
              --with-x=no \
              --with-aquaterm=no \
              --with-gd=no
#              --with-bitmap-terminals \
  make pkglibexecdir=/usr/bin
}

package() {
  cd "${srcdir}/gnuplot-${pkgver}"
  make pkglibexecdir=/usr/bin DESTDIR="${pkgdir}" install

  install -Dm644 Copyright -t "${pkgdir}/usr/share/licenses/$pkgname"

  rm -f "${pkgdir}/usr/share/texmf-dist/ls-R"
}
