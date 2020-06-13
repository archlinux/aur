# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=('freetype2-git' 'freetype2-demos-git' 'freetype2-docs-git')
pkgver=2.10.2+p7+ge13391333
pkgrel=1
epoch=1
pkgdesc="Font rasterization library (from git)"
arch=(i686 x86_64)
license=('GPL')
url="https://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11' 'git' 'python')
source=(git://git.sv.gnu.org/freetype/freetype2.git
        git://git.sv.gnu.org/freetype/freetype2-demos.git
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        0005-Enable-old-engines-but-keep-adobe-as-default.patch
        freetype-2.5.2-more-demos.patch
        cflags-order.patch
        freetype2.sh)
sha1sums=('SKIP'
          'SKIP'
          '07aecf77659ff956270c042990a013552b826e5e'
          'f03de1bd288de5251710a7d9b05a7aec9ebb4445'
          '6a47234d60eeec766fd2b00d18bab18cf06eb651'
          '82e08f0f4f6f5454d9706d24d45824b5ed412a37'
          '9ad5cbe34209ed2cd36687971dac7ba92688b774'
          '72cfecbe738085eec475e012617661ad0cc9b76f'
          '6b93645ff0bf25fcc67a01f764f884c9791bf09f'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
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
  python -m venv venv
  venv/bin/pip install docwriter

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../0005-Enable-old-engines-but-keep-adobe-as-default.patch

  ./autogen.sh

  cd ../freetype2-demos
  # enable more demos
  patch -Np1 -i ../freetype-2.5.2-more-demos.patch

  # ensure include dirs of built freetype come first
  patch -Np1 -i ../cflags-order.patch

  # Suppress RPATH
  sed -i '/X11_LIB:%=-R%/d' graph/x11/rules.mk
}

build() {
  export PATH="$srcdir/venv/bin:$PATH"

  cd freetype2
  ./configure --prefix=/usr --disable-static
  make

  # Build docs
  make refdoc

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
  install -Dt "${pkgdir}/etc/profile.d" -m644 ../freetype2.sh
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

package_freetype2-docs-git() {
  pkgdesc="Freetype documentation (from git)"
  depends=('freetype2-git')
  provides=("freetype2-docs=$pkgver")
  conflicts=('freetype2-docs')

  cd freetype2
  install -d "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/freetype2"
}

# vim:set ts=2 sw=2 et:
