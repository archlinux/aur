# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=gracegtk
pkgver=0.9.4
pkgrel=1
pkgdesc="A port of the Grace plotting tool to gtk2"
arch=(i686 x86_64)
url="http://plasma-gate.weizmann.ac.il/Grace/"
depends=('libjpeg' 'fftw' 't1lib' 'netcdf' 'pdflib-lite' 'gtk2')
makedepends=('linuxdoc-tools' 'gcc-fortran')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}_2016_04_20_16h15.tgz window_close.patch $pkgname.png $pkgname.desktop $pkgname-mimetypes ggrace)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  grep -rl "'H', TRUE" src | xargs sed -i -e "s/'H', TRUE/'H', FALSE/g"
  grep -rl "'H' ,TRUE" src | xargs sed -i -e "s/'H' ,TRUE/'H', FALSE/g"
  sed -i -e "s/.*right_justified.*//g" src/gg.c
  sed -i -e "s/.*right_justified.*//g" src/gg_gtkutils.c
  patch -p0 <../window_close.patch

  # The maintainer took down the fixed configure script which is still needed
  #cp "$srcdir"/configure_0.7.1_without_ac_fn_c_try_run ./configure
  sed -i -e 's|ac_fn_c_try_run ()|dummy ()|' configure
  sed -i -e 's|ac_fn_c_try_run|ac_fn_c_try_compile|g' configure
  sed -i -e 's|SIZEOF_INT|sizeof(int)|g' src/*.c
  sed -i -e 's|SIZEOF_FLOAT|sizeof(float)|g' src/*.c
  sed -i -e 's|SIZEOF_DOUBLE|sizeof(double)|g' src/*.c
  sed -i -e 's|SIZEOF_CHAR|sizeof(char)|g' src/*.c
  sed -i -e 's|SIZEOF_VOID_P|sizeof(void *)|g' src/*.c grace_np/*.c

  sed -i -e 's| -V -qversion||g' ./configure
  ./configure --prefix=/usr --with-f77=/usr/bin/gfortran
  make
}

package() {
  export TEXINPUTS=$TEXINPUTS:/usr/share/linuxdoc-tools
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  mkdir "$pkgdir"/usr/share
  mv "$pkgdir"/usr/$pkgname "$pkgdir"/usr/share/
  install -D -m755 "$srcdir/ggrace" "$pkgdir/usr/bin/ggrace"

  # Desktop integration
  install -D -m644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$srcdir/$pkgname-mimetypes" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}

md5sums=('b6716781546a5ff89825cc7f9f3799b8' '05b430f86615ab1aea79cee6ca204792' 'ef085e503d30207035f5dfbef648ed36' '8427067a73698b5425901866ca3195d0' '3beba5237f56a2ff28b6cd878865b25c' 'c22c24f810bf0e1f9b8ca8713be19e3e')
