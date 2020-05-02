# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Samuel Williams <https://www.codeotaku.com>

_pkgname=gnuplot
pkgname=${_pkgname}-caca
pkgver=5.2.8
pkgrel=1
pkgdesc="Plotting package which outputs to X11, PostScript, PNG, GIF, and others" 
arch=('x86_64')
url="http://www.gnuplot.info" 
license=('custom') 
depends=('readline' 'gd' 'wxgtk2' 'cairo' 'libjpeg' 'lua' 'qt5-svg' 'libcaca' 'gnutls') 
makedepends=('texinfo' 'texlive-core' 'emacs' 'texlive-latexextra' 'qt5-tools')
source=("https://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "lua53_compat.patch")

provides=($_pkgname)
conflicts=($_pkgname)

sha256sums=('60a6764ccf404a1668c140f11cc1f699290ab70daa1151bb58fed6139a28ac37'
            'bfd8a61abbf4491c74225cb9fd252619d4fc29751838bcb4c0639ffe05a00695')

prepare() {
  cd ${_pkgname}-${pkgver}

  # fix default source location; use the GDFONTPATH variable to modify at runtime
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

  sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
  -e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
  src/variable.c

  patch -p1 < "$srcdir"/lua53_compat.patch
}

build() {
  cd ${_pkgname}-${pkgver}

  MAKEINFO=/usr/bin/makeinfo  WX_CONFIG=/usr/bin/wx-config ./configure --prefix=/usr \
              --libexecdir=/usr/bin \
              --with-gihdir=/usr/share/gnuplot \
              --with-readline=gnu \
              --with-bitmap-terminals \
              --with-wx-single-threaded \
	      --with-caca \
              --with-texdir=/usr/share/texmf/tex/latex/gnuplot
  make pkglibexecdir=/usr/bin
}

package() {
  cd ${_pkgname}-${pkgver}
  make pkglibexecdir=/usr/bin DESTDIR="${pkgdir}" install

  install -Dm644 Copyright "${pkgdir}/usr/share/licenses/$pkgname/Copyright"

  rm -f "${pkgdir}/usr/share/texmf-dist/ls-R"
}

