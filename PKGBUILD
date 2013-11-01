# Contributor: Jan Cholasta <grubber at grubber cz>
# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=oblige
pkgver=4.28b
pkgrel=1
pkgdesc="A random level maker for games based on the Doom engine"
arch=('i686' 'x86_64')
url="http://oblige.sourceforge.net/"
license=('GPL')
depends=('fltk>=1.3.0')
makedepends=('glbsp>=2.24' 'imagemagick')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-428b-source.zip
        compile-fix.patch
        unix-fix.patch
        oblige.desktop)
md5sums=('ae89031dcff12958bb866505c266c49f'
         'adb49faac3febc5bed2dbd3b79f7ad1c'
         '3211b2b8dcbfde6a84af2adfb288da9a'
         'ee8efdcf10d4e71bf5b0f3ba45be5d4f')

build() {
  cd "$srcdir/Oblige-$pkgver-source"

  patch -p1 <"$srcdir/compile-fix.patch"
  patch -p1 <"$srcdir/unix-fix.patch"

  make -f Makefile.local \
    CXXFLAGS="$CXXFLAGS -Wall -DUNIX -Ilua_src `fltk-config --use-images --cxxflags` -DFHS_INSTALL" \
    GLBSP_OBJS= \
    LDFLAGS="`fltk-config --use-images --ldflags`" \
    LIBS="-lm -lz /usr/lib/libglbsp.a"

  pushd tools/qsavetex

  make \
    CXXFLAGS="$CXXFLAGS -Wall -fno-rtti -DUNIX"

  popd

  convert "gui/oblige.ico[0]" oblige.png
}

package() {
  cd "$srcdir/Oblige-$pkgver-source"

  install -Dm755 Oblige "$pkgdir/usr/bin/Oblige"
  ln -s /usr/bin/Oblige "$pkgdir/usr/bin/oblige"
  install -Dm755 tools/qsavetex/qsavetex "$pkgdir/usr/bin/qsavetex"

  local _dir
  for _dir in data scripts games engines prefabs modules; do
    find $_dir -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/oblige/{}" \;
  done

  install -Dm644 oblige.png "$pkgdir/usr/share/pixmaps/oblige.png"
  install -Dm644 "$srcdir/oblige.desktop" "$pkgdir/usr/share/applications/oblige.desktop"
}
