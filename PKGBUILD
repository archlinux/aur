# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=(freetype2-minimal-git)
pkgver=2.10.4+p10+g22bb0660a
pkgrel=1
epoch=1
pkgdesc="Font rasterization library (from git)"
url="https://www.freetype.org/"
arch=(x86_64 i686)
license=(GPL)
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=(zlib bzip2 sh libpng harfbuzz)
makedepends=(libx11 git)
source=(git://git.sv.nongnu.org/freetype/freetype2.git)
sha256sums=('SKIP')

pkgver() {
  local _tag _count

  cd "$srcdir/freetype2"
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count $_tag..HEAD)
  _tag=${_tag#VER-}
  echo ${_tag//-/.}+p$_count+g$(git rev-parse --short HEAD)
}

prepare() {
  cd freetype2

  ./autogen.sh

}

build() {
  cd freetype2
  ./configure --prefix=/usr --disable-static
  make
}

#check() {
#  cd freetype2
#  make -k check
#}

package_freetype2-minimal-git() {
  provides=(libfreetype.so "freetype2=$pkgver")
  conflicts=(freetype2)
  backup=(etc/profile.d/freetype2.sh)

  cd freetype2
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
