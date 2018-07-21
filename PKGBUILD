# Maintainer: dustball

pkgname=gnaural
pkgver=20110606
pkgrel=2
pkgdesc="An opensource binaural-beat generator"
arch=(i686 x86_64)
url="http://gnaural.sourceforge.net/"
license=('GPL')
depends=('libglade' 'portaudio')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/Gnaural/${pkgname}_${pkgver}.tar.xz")
md5sums=('a3f909ca56466393c9eef42f25fc028b')

build() {
  cd "$srcdir/${pkgname}_${pkgver}"

  # Fix a bug where an inlined function isn't marked as extern. GCC seems to have tolerated rather long, but eventually broke.
  sed -i 's/#endif/extern inline void BB_ResetAllVoices ();\n#endif/g' src/main.h src/gnauralXML.h
  sed -i 's/^inline void BB_ResetAllVoices/void BB_ResetAllVoices/g' src/BinauralBeat.c
      
  # desktop file path fix
  sed -i "s|gnome/apps/Multimedia|applications|g" Makefile.*

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
