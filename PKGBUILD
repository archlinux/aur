# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgname=gnuplot
pkgname=gnuplot-svg
pkgver=5.2.8
pkgrel=1
pkgdesc="Plotting package. Only SVG terminal support (for web-servers)" 
arch=('x86_64')
url="http://www.gnuplot.info" 
license=('custom') 
depends=('readline' 'gnutls') 
provides=('gnuplot')
conflicts=('gnuplot')
source=("https://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha1sums=('dc018b1e0a31b770d4635958badff13498babc4d')

prepare() {
  cd ${_pkgname}-${pkgver}

  # fix default source location; use the GDFONTPATH variable to modify at runtime
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' src/variable.c

  sed -i -e 's|/usr/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
  -e 's|$(X11ROOT)/X11R6/lib/X11/fonts/Type1|$(X11ROOT)/usr/share/fonts/Type1|' \
  src/variable.c
}

build() {
  cd ${_pkgname}-${pkgver}

  MAKEINFO=/usr/bin/makeinfo  WX_CONFIG=/usr/bin/wx-config ./configure --prefix=/usr \
              --libexecdir=/usr/bin \
              --disable-wxwidgets \
              --with-x=no \
              --with-gihdir=/usr/share/gnuplot \
              --with-readline=gnu \
              --with-bitmap-terminals \
              --with-qt=no \
              --without-latex \
              --disable-x11-mbfonts \
              --disable-x11-external \
              --without-libcerf \
              --with-aquaterm=no \
              --with-gd=no \
              --without-cairo \
              --without-lua
  make pkglibexecdir=/usr/bin
}

package() {
  cd ${_pkgname}-${pkgver}
  make pkglibexecdir=/usr/bin DESTDIR="${pkgdir}" install

  install -Dm644 Copyright "${pkgdir}/usr/share/licenses/$_pkgname/Copyright"

  rm -f "${pkgdir}/usr/share/texmf-dist/ls-R"
}
