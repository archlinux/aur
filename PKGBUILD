# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=(freetype2-git freetype2-demos-git freetype2-docs-git)
pkgver=2.10.4+p183+g2149b51f2
pkgrel=2
epoch=1
pkgdesc="Font rasterization library (from git)"
url="https://www.freetype.org/"
arch=(x86_64 i686)
license=(GPL)
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=(zlib bzip2 sh libpng harfbuzz)
makedepends=(libx11 git python-virtualenv)
source=(git+https://gitlab.freedesktop.org/freetype/freetype.git
        git+https://gitlab.freedesktop.org/freetype/freetype-demos.git
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        0005-Enable-old-engines-but-keep-adobe-as-default.patch
        freetype2.sh)
sha256sums=('SKIP'
            'SKIP'
            'c83f4bb4b86877ceae5bf481419776e3f19876b2a1e5f481446ed2d5f4ff6766'
            '9c9b379ccf549b0826620d9d4468cba1f8c40f18c5ab1ed6da409d2b628eaad2'
            '50f7b54e946224e9eb10b9ac51e344582038b9cd0469b64380f8809ac61ae796'
            '0f79260c148461a303da06a869890c22b7bb2984b6d01075cfc59bdefd988582'
            '4aa6ffc3b8c66f2ef23f234570196e1209d2abb9ce0a5c7bfbc1321b2e81b68e'
            'f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467')
validpgpkeys=(58E0C111E39F5408C5D3EC76C1A60EACE707FDA5) # Werner Lemberg <wl@gnu.org>

pkgver() {
  local _tag _count

  cd freetype
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count $_tag..HEAD)
  _tag=${_tag#VER-}
  echo ${_tag//-/.}+p$_count+g$(git rev-parse --short HEAD)
}

prepare() {
  cd freetype
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../0005-Enable-old-engines-but-keep-adobe-as-default.patch

  ./autogen.sh

  cd ../freetype-demos

  # Suppress RPATH
  sed -i '/X11_LIB:%=-R%/d' graph/x11/rules.mk
}

build() {
  cd freetype
  ./configure --prefix=/usr --disable-static
  make

  # Build docs
  make refdoc-venv

  # Build demos
  cd ../freetype-demos
  make
}

check() {
  cd freetype
  make -k check
}

package_freetype2-git() {
  provides=(libfreetype.so "freetype2=$pkgver")
  conflicts=(freetype2)
  install=freetype2.install
  backup=(etc/profile.d/freetype2.sh)

  cd freetype
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/etc/profile.d" -m644 ../freetype2.sh
}

package_freetype2-demos-git() {
  pkgdesc="Freetype tools and demos (from git)"
  depends=(freetype2-git libx11)
  provides=("freetype2-demos=$pkgver")
  conflicts=(freetype2-demos)

  cd freetype-demos
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

  cd freetype
  install -d "$pkgdir/usr/share/doc"
  cp -a docs "$pkgdir/usr/share/doc/freetype2"
  rm -r "$pkgdir/usr/share/doc/freetype2/env"
}

# vim:set ts=2 sw=2 et:
