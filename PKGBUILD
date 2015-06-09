# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Dragonlord <dragonlord[at]seznam[.]cz>
# Contributor: daniel <quite a hack org>

pkgname=fim
_pkgname='rc1'
pkgver=0.4
pkgrel=9
pkgdesc="Highly customizable and scriptable framebuffer image viewer based on fbi."
arch=('i686' 'x86_64')
conflicts=('fim-svn')
url="https://www.autistici.org/dezperado/fim/"
license=('GPL')
optdepends=('djvulibre: djvu support'
            'libspectre: postscript support'
            'sdl: X support'
            'poppler: PDF support')
depends=('giflib' 'libjpeg-turbo')

# It doesn't like to be parallel built
options=(!makeflags)
install=install
source=("http://download.savannah.gnu.org/releases/fbi-improved/$pkgname-$pkgver-${_pkgname}.tar.bz2")
md5sums=('4aea815884ba98a3d2efe7263351b848')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgname"
  sed -i -e 's#\(DGifCloseFile(h->gif\));#\1, \&h->ErrorCode);#' \
         -e 's#char .Err#const &#' src/FbiStuffGif.cpp
}

build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgname"
  ./configure --prefix=/usr --disable-debug --enable-unicode --enable-hardcoded-font \
              --enable-recursive-dirs --disable-xcftopnm --disable-inkscape \
              --disable-xfig --disable-dia --disable-imlib2

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgname"
  make DESTDIR=$pkgdir install
}
