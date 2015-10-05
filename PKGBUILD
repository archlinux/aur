# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-git
epoch=1
pkgver=2.6.1+p1+g30fe5e7
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
          '1c7bc438df0428a63f881e7e4343b22c5b09ecb1'
          'e2d2b8c4847ab9cfd497179c7140835e99ece711'
          'ebe3d7a6fc41304a77c23cb56e94dc718146d963'
          '0a75db92c93c7a1576052348174fa510740d079f')

provides=("freetype2=$pkgver" libfreetype.so)
conflicts=("freetype2")

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
