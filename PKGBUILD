# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

# The mono-tool package now calls make-search-index by post_install().
# Whenever a package is installed which places doc-sources into:
# /usr/lib/monodoc/sources it should call --make-search-index with
# post_install() and with post remove. mond-tools itself deletes the index
# file pre_remove(), so pacman finds the directory empty an removes it
# properly.

pkgname=mono-tools
pkgver=2.10
pkgrel=2
pkgdesc="collection of testing and development tools for use with mono (including monodoc browser)"
arch=(i686 x86_64)
license=('GPL')
url="http://www.mono-project.com/"
depends=('libgnome-sharp' 'gtkhtml-sharp')
makedepends=('gconf-sharp')
install=$pkgname.install
source=(http://download.mono-project.com/sources/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('da178df2c119c696c08c09dc9eb01994')

build() {
 # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR="${startdir}/src/weird"
  mkdir -p "${MONO_SHARED_DIR}"
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi 
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make GACUTIL="/usr/bin/gacutil /root $pkgdir/usr/lib" DESTDIR="$pkgdir" install
 }
