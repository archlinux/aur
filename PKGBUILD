# Maintainer: Nimrod Maclomhair <nimrod4garoa@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgname=gnuplot
pkgname=gnuplot-headless
pkgver=6.0.3
pkgrel=1
pkgdesc='Plotting package which outputs to PostScript, PNG, GIF, and others, without X deps'
arch=('i686' 'x86_64' 'aarch64' 'aarch32') 
url='http://www.gnuplot.info'
license=(LicenseRef-Gnuplot)
depends=(gcc-libs
         glibc
         libcerf
         lua
         readline)
makedepends=(texlive-latexextra)
provides=(gnuplot)
conflicts=(gnuplot)
source=(https://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz
        lua53_compat.patch)
sha256sums=('ec52e3af8c4083d4538152b3f13db47f6d29929a3f6ecec5365c834e77f251ab'
            'bfd8a61abbf4491c74225cb9fd252619d4fc29751838bcb4c0639ffe05a00695')

prepare() {
  cd $_pkgname-$pkgver

  patch -p1 < "$srcdir"/lua53_compat.patch
}

build() {
  cd $_pkgname-$pkgver

  # If you want png and jpeg terminal support, set --with-gd and get
  # add "gd-headless" as an depency.
  MAKEINFO=/usr/bin/makeinfo \
  ./configure --prefix=/usr \
              --libexecdir=/usr/bin \
              --with-gihdir=/usr/share/gnuplot \
              --with-readline=gnu \
              --with-bitmap-terminals \
              --with-texdir=/usr/share/texmf/tex/latex/gnuplot \
              --disable-x11-mbfonts \
              --disable-x11-external \
              --disable-wxwidgets \
              --without-cairo \
              --with-qt=no \
              --disable-raise-console \
              --with-x=no \
              --with-aquaterm=no \
              --with-gd=no
  make pkglibexecdir=/usr/bin
}

package() {
  cd $_pkgname-$pkgver
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install

  install -Dm644 Copyright -t "$pkgdir"/usr/share/licenses/$pkgname

  rm -f "$pkgdir"/usr/share/texmf-dist/ls-R
}
