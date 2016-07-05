# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-git
epoch=1
pkgver=2.6.4+p0+gd80fe69
pkgrel=1
pkgdesc="TrueType font rendering library (from git)"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('git')
provides=('libfreetype.so' "freetype2=$pkgver")
conflicts=('freetype2')
install=freetype2.install
source=(git://git.sv.gnu.org/freetype/freetype2.git
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Make-subpixel-hinting-mode-configurable.patch)
sha1sums=('SKIP'
          '045b1b6a56151ab46a8300e6fd09f24294258e97'
          'afd6f9504516fa02e57890dde820f488e0df36bb'
          '2a1d6e734001e196c7a7790c78165d9b9fe49f7f')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

pkgver() {
  local _tag _count

  cd "${srcdir}/freetype2"
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count ${_tag}..HEAD)
  _tag=${_tag#VER-}
  echo ${_tag//-/.}+p$_count+g$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/freetype2"
  patch -Np1 -i "${srcdir}/0001-Enable-table-validation-modules.patch"
  patch -Np1 -i "${srcdir}/0002-Enable-subpixel-rendering.patch"

  # Provide a way to set the default subpixel hinting mode
  # at runtime, without depending on the application to do so.
  patch -Np1 -i "${srcdir}/0003-Make-subpixel-hinting-mode-configurable.patch"

  ./autogen.sh
}

build() {
  cd "${srcdir}/freetype2"
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "${srcdir}/freetype2"
  make -k check
}

package() {
  cd "${srcdir}/freetype2"
  make DESTDIR="${pkgdir}" install
}
