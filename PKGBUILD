# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Liberion <liberion[at]gmail[.]com> patch libpng compile 
# Maintainer: SanskritFritz (gmail)

pkgname=briquolo
pkgver=0.5.7
pkgrel=6
pkgdesc="Breakout game with 3D representation based on OpenGL."
arch=('i686' 'x86_64')
url="http://briquolo.free.fr/"
license=('GPL')
depends=('sdl_mixer' 'sdl_ttf' 'desktop-file-utils' 'glu')
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
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  autoreconf -fi
  ./configure --prefix=/usr --with-x=yes --with-sdl=yes --disable-rpath --disable-sdltest
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
# Fix for buggy Makefile - give it a desktop file to process
  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop

  make prefix="${pkgdir}"/usr install
#  make DESTDIR="${pkgdir}" install

# Icons
  install -Dm644 "$srcdir/$pkgname-$pkgver/desktop/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

# Force usage of correct desktop entry
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir"/usr/share/applications/$pkgname.desktop
}
