# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=('freetype2-git' 'freetype2-demos-git')
pkgver=2.8+p86+g410f3799
pkgrel=2
epoch=1
pkgdesc="Font rasterization library (from git)"
arch=(i686 x86_64)
license=('GPL')
url="https://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11' 'git' 'python2')
source=(git://git.sv.gnu.org/freetype/freetype2.git
        git://git.sv.gnu.org/freetype/freetype2-demos.git
        0001-Enable-table-validation-modules.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        0005-freetype-2.5.2-more-demos.patch
        freetype2.sh)
sha1sums=('SKIP'
          'SKIP'
          'c3e91e668936206d3c158bffde0f69788a086a5b'
          '81586014ea44375ddc85dd9dbcabae6e91c34d62'
          '334f229875039794adeb574e27d365bb445fb314'
          '72cfecbe738085eec475e012617661ad0cc9b76f'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch

  ./autogen.sh

  cd ../freetype2-demos
  # enable more demos
  patch -Np1 -i ../0005-freetype-2.5.2-more-demos.patch

  # Suppress RPATH
  sed -i '/X11_LIB:%=-R%/d' graph/x11/rules.mk
}

pkgver() {
  local _tag _count

  cd "${srcdir}/freetype2"
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count ${_tag}..HEAD)
  _tag=${_tag#VER-}
  echo ${_tag//-/.}+p$_count+g$(git rev-parse --short HEAD)
}

build() {
  cd freetype2
  ./configure --prefix=/usr --disable-static
  make

  # Build docs
  PATH="$srcdir/path:$PATH" make refdoc

  # Build demos
  cd ../freetype2-demos
  make
}

check() {
  cd freetype2
  make -k check
}

package_freetype2-git() {
  provides=('libfreetype.so' "freetype2=$pkgver")
  conflicts=('freetype2')
  install=freetype2.install
  backup=('etc/profile.d/freetype2.sh')

  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"

  # Package docs
  install -d "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/freetype2"
}

package_freetype2-demos-git() {
  pkgdesc="Freetype tools and demos (from git)"
  depends=('freetype2-git' 'libx11')
  provides=("freetype2-demos=$pkgver")
  conflicts=('freetype2-demos')

  cd freetype2-demos
  install -d "${pkgdir}/usr/bin"
  for _i in bin/{f,t}t*; do
    libtool --mode=install install $_i "${pkgdir}/usr/bin"
  done
}

# vim:set ts=2 sw=2 et:
