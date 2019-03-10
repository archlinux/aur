# Maintainer: JP Cimalando <jp-dev@inbox.ru>

pkgname=mingw-w64-fltk
_pkgname=fltk
pkgdesc="Graphical user interface toolkit for X (mingw-w64)"
pkgver=1.3.5
pkgrel=1
arch=('any')
license=('custom:LGPL')
url="http://www.fltk.org/"
depends=('mingw-w64-libjpeg' 'mingw-w64-libpng' 'mingw-w64-zlib' 'mingw-w64-crt'
         'bash')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
source=(http://fltk.org/pub/fltk/$pkgver/fltk-$pkgver-source.tar.gz
        subdirs.patch)
md5sums=('e85017defd5a03ae82e634311db87bbf'
         '42d65739702f35bfe40ae15d59c77c66')
options=('!docs' '!strip' '!buildflags' 'staticlibs')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i ../subdirs.patch
  sed -i 's/class Fl_XFont_On_Demand/class FL_EXPORT Fl_XFont_On_Demand/' FL/x.H
  sed -i 's/x-fluid.desktop/fluid.desktop/' -i fluid/Makefile
}

build() {
  cd $_pkgname-$pkgver
  sed -i -e 's/$(LINKFLTK)/$(LINKSHARED)/' \
         -e 's/$(LINKFLTKIMG)/$(LINKSHARED)/' test/Makefile
  for arch in x86_64-w64-mingw32 i686-w64-mingw32; do
    cp -a "$srcdir/$_pkgname-$pkgver" "$srcdir/build-$arch"
    cd "$srcdir/build-$arch"
    "$arch"-configure --prefix=/usr/"$arch" --enable-threads --enable-xft --enable-shared .
    make
  done
}

package() {
  for arch in x86_64-w64-mingw32 i686-w64-mingw32; do
    cd "$srcdir/build-$arch"
    make DESTDIR="$pkgdir" install
    chmod 0644 "$pkgdir/usr/$arch/lib"/*.a
    install -d "$pkgdir/usr/bin"
    ln -sf "../$arch/bin/fltk-config" "$pkgdir/usr/bin/$arch-fltk-config"
  done

  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
