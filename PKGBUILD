# Maintainer:
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Liberion <liberion[at]gmail[.]com> patch libpng compile 

pkgname=briquolo
pkgver=0.5.7
pkgrel=5
pkgdesc="An addictive block game"
arch=('i686' 'x86_64')
url="http://briquolo.free.fr/"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'libpng' 'sdl_ttf' 'mesa' 'desktop-file-utils' 'glu')
makedepends=('patch' 'autoconf' 'automake' 'cvs')
install=$pkgname.install
options=('!makeflags')
source=(http://briquolo.free.fr/download/$pkgname-$pkgver.tar.bz2 \
        $pkgname.desktop $pkgname.png $pkgname-gcc.patch $pkgname-libpng.patch)
md5sums=('e24d22d2d719d64c231d3d76f9291d6e'
         '0fb2744c4bb0e36bf9599a77a54183d7'
         '6a310dfa94225c9e16571e4e25eebfb3'
         'd3077d1a57e531bbe8d1b15dae09969f'
         'f9b3afa24803a02d23616b859d880b1d')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

# Fixes gcc 4.3 compilation
  patch -Np0 -i "${srcdir}"/$pkgname-gcc.patch
# Fixes libpng compilation problem
  patch -Np1 -i "${srcdir}"/$pkgname-libpng.patch
# Fix for buggy Makefile - give it a desktop file to process
  install -Dm644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  autoreconf -fi
  ./configure --prefix=/usr --with-x=yes --with-sdl=yes --disable-rpath --disable-sdltest
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make prefix="${pkgdir}"/usr install
#  make DESTDIR="${pkgdir}" install

# Icons
  install -Dm644 "${srcdir}"/$pkgname-$pkgver/desktop/$pkgname.svg \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.svg
  install -Dm644 $pkgname.png \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.png

# Force usage of correct desktop entry
  install -Dm644 $pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
