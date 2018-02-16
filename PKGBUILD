# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gnuplot
pkgver=5.2.2
pkgrel=1
pkgdesc="Plotting package which outputs to X11, PostScript, PNG, GIF, and others" 
arch=('x86_64')
url="http://www.gnuplot.info" 
license=('custom') 
depends=('readline' 'gd' 'wxgtk2' 'cairo' 'libjpeg' 'lua' 'qt5-svg' 'libcaca' 'gnutls') 
makedepends=('texinfo' 'texlive-core' 'emacs' 'texlive-latexextra' 'qt5-tools')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
        "lua53_compat.patch")
sha1sums=('fc39158851f39e48136d2bdd3f753bf46a99965c'
          '9005fa9e4da91ceedb8ccd1d761866e7b064f8b1')

prepare() {
  cd ${pkgname}-${pkgver}

  # fix default source location; use the GDFONTPATH variable to modify at runtime
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

  sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
  -e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
  src/variable.c

  patch -p1 < "$srcdir"/lua53_compat.patch
}

build() {
  cd ${pkgname}-${pkgver}

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
  cd ${pkgname}-${pkgver}
  make pkglibexecdir=/usr/bin DESTDIR="${pkgdir}" install

  install -Dm644 Copyright "${pkgdir}/usr/share/licenses/$pkgname/Copyright"

  rm -f "${pkgdir}/usr/share/texmf-dist/ls-R"
}

