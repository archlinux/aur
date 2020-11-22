# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=(freetype2-git freetype2-demos-git freetype2-docs-git)
pkgver=2.10.4+p16+g5abd252a0
pkgrel=1
epoch=1
pkgdesc="Font rasterization library (from git)"
url="https://www.freetype.org/"
arch=(x86_64 i686)
license=(GPL)
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=(zlib bzip2 sh libpng harfbuzz)
makedepends=(libx11 git python-virtualenv)
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
            '8b6f8b0798e77b945bad03cb01b1dbd654b18b0e9adf39cb5106ccfa104530a6'
            '7da842a8f487e0948d34b0ed743ae48d43daee09f6f241fb2516be7e06d2c87c'
            'b089eaa1a7fe97f3f6fc66c8d6f93ae9cb69db8b93711adabb4b2bd5a57b150e'
            '68eb9b5de88d562db961bb835dc55069474b7be3ce52b0909da95a74e8a69667'
            'fabfa40b42fac7a41231d4484bad2b9310bda9b441a887e9c38869f19353649a'
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
  cd freetype2
  ./configure --prefix=/usr --disable-static
  make

  # Build docs
  make refdoc-venv

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
