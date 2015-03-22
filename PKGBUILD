# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=oblige
pkgver=6.20
pkgrel=1
pkgdesc="A random level maker for games based on the Doom engine"
arch=('i686' 'x86_64')
url="http://oblige.sourceforge.net/"
license=('GPL')
depends=('fltk>=1.3.0')
makedepends=('imagemagick')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver/./}-source.zip
        compile-fix.patch
        unix-fix.patch
        oblige.desktop)
md5sums=('3d18e3b0477190755c390e764c8fafa3'
         '94f94c1d48dc42f030c2b5f74de0fde4'
         '3211b2b8dcbfde6a84af2adfb288da9a'
         'ee8efdcf10d4e71bf5b0f3ba45be5d4f')

prepare() {
  cd "$srcdir/Oblige-$pkgver-source"

  patch -p1 <"$srcdir/compile-fix.patch"
  patch -p1 <"$srcdir/unix-fix.patch"
}

build() {
  cd "$srcdir/Oblige-$pkgver-source"

  g++ -o obj_linux/oblige_res.o -x c++ -c - <<<''
  make -f Makefile.xming \
    PROGRAM=Oblige \
    OBJ_DIR=obj_linux \
    OS=UNIX \
    CXX=g++ \
    CXXFLAGS="$CXXFLAGS -Wall -DUNIX -Ilua_src -Iglbsp_src -Iajpoly_src `fltk-config --use-images --cxxflags`" \
    LDFLAGS="`fltk-config --use-images --ldflags`" \
    LIBS="-lm -lz"

  (cd tools/qsavetex && exec make CXXFLAGS="$CXXFLAGS -Wall -DUNIX")

  convert "gui/oblige.ico[0]" oblige.png
}

package() {
  cd "$srcdir/Oblige-$pkgver-source"

  install -Dm755 Oblige "$pkgdir/usr/bin/Oblige"
  ln -s /usr/bin/Oblige "$pkgdir/usr/bin/oblige"
  install -Dm755 tools/qsavetex/qsavetex "$pkgdir/usr/bin/qsavetex"

  local _dir
  for _dir in data scripts games engines modules; do
    find $_dir -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/oblige/{}" \;
  done

  install -Dm644 oblige.png "$pkgdir/usr/share/pixmaps/oblige.png"
  install -Dm644 "$srcdir/oblige.desktop" "$pkgdir/usr/share/applications/oblige.desktop"
}
