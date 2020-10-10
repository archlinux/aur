# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=(freetype2-git freetype2-demos-git freetype2-docs-git)
pkgver=2.10.3+p0+g337670af0
pkgrel=1
epoch=1
pkgdesc="Font rasterization library (from git)"
url="https://www.freetype.org/"
arch=(x86_64 i686)
license=(GPL)
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=(zlib bzip2 sh libpng harfbuzz)
makedepends=(libx11 git python)
source=(git://git.sv.gnu.org/freetype/freetype2.git
        git://git.sv.gnu.org/freetype/freetype2-demos.git
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        0005-Enable-old-engines-but-keep-adobe-as-default.patch
        freetype2.sh)
sha256sums=('SKIP'
            'SKIP'
            'f41df4f336d5e82e58733c7a4594476c9216cfc85c096327745a7e1b559e17e1'
            'dc77c1cfee4bf8e7e0690628c95d211df09e0d0750e4c8f075b78b5f105514f7'
            '21a62bc12b848320c686d602d8d4e3bcd51294a9def4dc9c301736e077b59f3f'
            '266384222f87a02fb02b2179828f6c26fe6d7b1fd09d1f7e3734e7fcb09cda2e'
            '04e622f514bc0ae6ecd21c8050115e2356058fcb49bc21d0f54358972f5d5639'
            'f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467')
validpgpkeys=(58E0C111E39F5408C5D3EC76C1A60EACE707FDA5) # Werner Lemberg <wl@gnu.org>

pkgver() {
  local _tag _count

  cd "$srcdir/freetype2"
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count $_tag..HEAD)
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
  provides=(libfreetype.so "freetype2=$pkgver")
  conflicts=(freetype2)
  install=freetype2.install
  backup=(etc/profile.d/freetype2.sh)

  cd freetype2
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/etc/profile.d" -m644 ../freetype2.sh
}

package_freetype2-demos-git() {
  pkgdesc="Freetype tools and demos (from git)"
  depends=(freetype2-git libx11)
  provides=("freetype2-demos=$pkgver")
  conflicts=(freetype2-demos)

  cd freetype2-demos
  install -d "$pkgdir/usr/bin"
  for _i in bin/{f,t}t*; do
    libtool --mode=install install $_i "$pkgdir/usr/bin"
  done
}

package_freetype2-docs-git() {
  pkgdesc="Freetype documentation (from git)"
  depends=(freetype2-git)
  provides=("freetype2-docs=$pkgver")
  conflicts=(freetype2-docs)

  cd freetype2
  install -d "$pkgdir/usr/share/doc"
  cp -a docs "$pkgdir/usr/share/doc/freetype2"
}

# vim:set ts=2 sw=2 et:
