# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-git
epoch=1
pkgver=2.6.5+p61+ga6ee6fe
pkgrel=1
pkgdesc="TrueType font rendering library (from git)"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11' 'git' 'python2')
provides=('libfreetype.so' "freetype2=$pkgver")
conflicts=('freetype2')
install=freetype2.install
backup=('etc/profile.d/freetype2.sh')
source=(git://git.sv.gnu.org/freetype/freetype2.git
        git://git.sv.gnu.org/freetype/freetype2-demos.git
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-subpixel-hinting.patch
        freetype2.sh)
sha1sums=('SKIP'
          'SKIP'
          'b5307ca1f11cb14081aef2b2439377ba99537bb3'
          '0ccdef0066335efa41b375c44c3d783e361f188e'
          '419d4e5b766742f08ebb2d01c2b9545eec827c81'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-subpixel-hinting.patch

  ./autogen.sh

  cd ../freetype2-demos

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

package() {
  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"

  # Package docs
  install -dm755 "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/freetype2"

  # Package demos
  cd ../freetype2-demos
  for _i in bin/{f,t}t*; do
    libtool --mode=install install $_i "$pkgdir/usr/bin/"
  done
}
