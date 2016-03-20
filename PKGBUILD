# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=oblige
pkgver=6.20
pkgrel=2
pkgdesc="A random level maker for games based on the Doom engine"
arch=('i686' 'x86_64')
url="http://oblige.sourceforge.net/"
license=('GPL')
depends=('fltk>=1.3.0')
makedepends=('imagemagick')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver/./}-source.tar.gz
        compile-fix.patch
        unix-fix.patch
        oblige.desktop)
sha256sums=('c9f2d729035a5182635ded001d2d49db8702424ab989a71d6b4fc80d754f66f9'
            '8b074059bda801e9548c6217f0b55a7274cec5578e6ad53f8b216d818a02bb34'
            '0fe83e37c8b6baed81bed017eb5892a5efc767d50bd4a638cb5defb59451ce91'
            '20b95ae8676678de686d2f5ad179ff3741be375c46418c8c5455bfea3bb81fae')

prepare() {
  cd Oblige-$pkgver-source

  patch -p1 <"$srcdir/compile-fix.patch"
  patch -p1 <"$srcdir/unix-fix.patch"
}

build() {
  cd Oblige-$pkgver-source

  g++ -o obj_linux/oblige_res.o -x c++ -c - <<<''
  make -f Makefile.xming \
       PROGRAM=Oblige \
       OBJ_DIR=obj_linux \
       OS=UNIX \
       CXX=g++ \
       CXXFLAGS="$CXXFLAGS -Wall -DUNIX -Ilua_src -Iglbsp_src -Iajpoly_src `fltk-config --use-images --cxxflags`" \
       LDFLAGS="`fltk-config --use-images --ldflags`" \
       LIBS="-lm -lz"

  (
    cd tools/qsavetex
    exec make CXXFLAGS="$CXXFLAGS -Wall -DUNIX"
  )

  convert "gui/oblige.ico[0]" oblige.png
}

package() {
  cd Oblige-$pkgver-source

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
