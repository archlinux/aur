# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-git
pkgver=2.6+6+g5931268-1
pkgrel=1
pkgdesc="TrueType font rendering library (from git)"
arch=(i686 x86_64)
license=('GPL')
url="http://freetype.sourceforge.net"
# adding harfbuzz for improved OpenType features auto-hinting 
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('git')
source=(git://git.sv.gnu.org/freetype/freetype2.git
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-subpixel-hinting.patch
        0004-Add-env-var-to-turn-off-subpixel-hinting.patch)
sha1sums=('SKIP'
          'ccc9aaf53621a6e752b01db9e054aa63eb56f9b6'
          'a9e78bc59ed06f3e11efc33e54fd7695899862a5'
          '3b69ac9f198ee3e4459e2466d3cb0f0b07cc3837'
          '7517bf45c066d036e3ec729b17c8fa221e4e81a0')

provides=("freetype2=$pkgver" libfreetype.so)
conflicts=("freetype2")

pkgver() {
  local _tag _count

  cd "${srcdir}/freetype2"
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count ${_tag}..HEAD)
  _tag=${_tag#VER-}
  echo ${_tag//-/.}+$_count+g$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/freetype2"
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-subpixel-hinting.patch
  patch -Np1 -i ../0004-Add-env-var-to-turn-off-subpixel-hinting.patch
}

build() {
  cd "${srcdir}/freetype2"
  ./autogen.sh
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
