# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=freetype2
pkgname=lib32-$_pkgbasename-minimal-git
pkgver=2.9.1+p305+g8d517e679
pkgrel=1
pkgdesc="TrueType font rendering library (32-bit)"
arch=(x86_64)
license=('GPL')
url="https://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('lib32-zlib' 'lib32-bzip2' 'lib32-libpng' 'lib32-harfbuzz' $_pkgbasename)
makedepends=('gcc-multilib')
provides=('libfreetype.so' 'lib32-freetype2')
conflicts=('lib32-freetype2')
source=(git://git.sv.nongnu.org/freetype/freetype2.git)
sha1sums=('SKIP')
validpgpkeys=('SKIP')

pkgver() {
  local _tag _count

  cd "${srcdir}/freetype2"
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count ${_tag}..HEAD)
  _tag=${_tag#VER-}
  echo ${_tag//-/.}+p$_count+g$(git rev-parse --short HEAD)
}

prepare() {

  cd freetype2

  ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd freetype2
  ./configure --prefix=/usr --disable-static --libdir=/usr/lib32
  make
}

#check() {
#  cd freetype2
#  make -k check
#}

package() {
  cd freetype2
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/{include,share}
}

# vim:set ts=2 sw=2 et:
