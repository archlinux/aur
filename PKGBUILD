# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=gracegtk
pkgver=1.3.0
pkgrel=1
pkgdesc="A port of the Grace plotting tool to gtk2"
arch=(i686 x86_64)
url="http://plasma-gate.weizmann.ac.il/Grace/"
depends=('libjpeg' 'fftw' 't1lib' 'netcdf' 'pdflib-lite' 'gtk2')
makedepends=('linuxdoc-tools')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz window_close.patch $pkgname.png $pkgname.desktop $pkgname-mimetypes ggrace)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i -e "s/.*right_justified.*//g" src/gg.c
  sed -i -e "s/.*right_justified.*//g" src/gg_gtkutils.c
  patch -p0 <../window_close.patch

  # The maintainer took down the fixed configure script which is still needed
  #cp "$srcdir"/configure_0.7.1_without_ac_fn_c_try_run ./configure
  sed -i -e 's|ac_fn_c_try_run ()|dummy ()|' configure
  sed -i -e 's|ac_fn_c_try_run|ac_fn_c_try_compile|g' configure
  sed -i -e 's|SIZEOF_INT|sizeof(int)|g' src/*.c src/pars.yacc
  sed -i -e 's|SIZEOF_FLOAT|sizeof(float)|g' src/*.c src/pars.yacc
  sed -i -e 's|SIZEOF_DOUBLE|sizeof(double)|g' src/*.c src/pars.yacc
  sed -i -e 's|SIZEOF_CHAR|sizeof(char)|g' src/*.c src/pars.yacc
  sed -i -e 's|SIZEOF_VOID_P|sizeof(void *)|g' src/*.c grace_np/*.c

  sed -i -e 's| -V -qversion||g' ./configure
  FCFLAGS="-g" ./configure --prefix=/usr --with-f77=/usr/bin/gfortran
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

sha256sums=('5be0e9a72b76c4877cf23ebbb4e808ed52fa889756314505dd86ed1ebcfb84fb'
            '8581e5ca78d8a807fc0813099c806d18bbdc3aafe4a6e476ae9e0b879b09ce99'
            'd87e9e9c682019a33fdd779a3942313b38d9c14e0a0ec36aaa980e1ff65cf15c'
            '645828fc69d2b130ff2af711a639c4923e5c38715e83002ef74be349fd3a4a2f'
            '00c16404b9c9386c32a298a3ec8842d2bef8ad6b278a817157ee4af65fcf1479'
            'c0cded47b538c040835ab6eb37aca1f440dc9549db355316d59f2ec30a7e1f3b')
