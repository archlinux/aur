# Maintainer: dustball

pkgname=gnaural
pkgver=20110606
pkgrel=1
pkgdesc="An opensource binaural-beat generator"
arch=(i686 x86_64)
url="http://gnaural.sourceforge.net/"
license=('GPL')
depends=('libglade' 'portaudio')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/Gnaural/$pkgname-$pkgver.tar.xz")
md5sums=('55dd6c32ae08c637e40774c22d6c09ba')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix a bug where an inlined function isn't marked as extern. GCC seems to have tolerated rather long, but eventually broke.
  sed -i 's/#endif/extern inline void BB_ResetAllVoices ();\n#endif/g' src/main.h src/gnauralXML.h
  sed -i 's/^inline void BB_ResetAllVoices/void BB_ResetAllVoices/g' src/BinauralBeat.c
      
  # desktop file path fix
  sed -i "s|gnome/apps/Multimedia|applications|g" Makefile.*

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
