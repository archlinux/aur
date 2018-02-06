# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: tobias [tobias.archlinux.org]

pkgname=cinepaint
_realver=1.0-4
pkgver=${_realver/-/.}
pkgrel=7
epoch=1
pkgdesc="Sophisticated graphics manipulation programm supporting > 8bit pictures"
arch=('x86_64' 'i686')
license=('LGPL' 'GPL' 'MIT')
url="http://www.cinepaint.org"
depends=('gtk2' 'openexr' 'lcms' 'libxpm' 'fltk' 'ftgl' 'libxxf86vm')
makedepends=('python2' 'gutenprint>=5.2.9' 'optipng')
optdepends=('python2: for python plug-ins'
            'gutenprint: for print plug-ins'
            'ghostscript: for pdf plug-ins')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$_realver.tar.gz
        LICENSE cinepaint-libpng15.patch)
sha1sums=('2049958784d211cc0be8f41f3473433479ba71fe'
          'ca8411db87f3fc51bbdfade22f4e1f555b2ee19e'
          '3dfc9f06f02791aee59b60d33ddf9d305b0f1de5')

prepare() {
  cd $pkgname-$_realver
  patch -p1 -i ../cinepaint-libpng15.patch
  find . -name \*.png -exec optipng -quiet -force -fix {} +
}

build() {
  export LDFLAGS="$LDFLAGS -lstdc++ -lm -lX11"

  cd $pkgname-$_realver
  ./configure --prefix=/usr \
    --libdir=/usr/lib --mandir=/usr/share/man \
    --enable-gtk2 --enable-pygimp --with-python=/usr/bin/python2

  find . -name Makefile -exec sed -i 's/-Wl,,/-Wl,/g' {} +

  make

  sed -i -e "s|-I$srcdir/cinepaint||" \
    -e "s|-I$srcdir/cinepaint-${_realver}/lib||" \
    -e "/libcinepaint.la/d" \
    -e "s|$srcdir/cinepaint-${_realver}/lib/.libs/\$dlname||" \
    "cinepainttool"
  sed -i "s/cinepaint.png/cinepaint/" "cinepaint.desktop"
}

package() {
  cd $pkgname-$_realver
  make DESTDIR="$pkgdir" install

  # Fix default settings (FS#44464)
  mv "$pkgdir/usr/share/cinepaint/${_realver}/gimprc" "$pkgdir/usr/share/cinepaint/${_realver}/cinepaintrc"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
