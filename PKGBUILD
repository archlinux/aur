# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-git
pkgname=(freetype2-git freetype2-demos-git)
pkgver=2.12.0+p2+g385345037
pkgrel=1
epoch=1
pkgdesc="Font rasterization library (from git)"
url="https://www.freetype.org/"
arch=(x86_64 i686)
license=(GPL)
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=(zlib bzip2 sh libpng harfbuzz brotli)
makedepends=(libx11 qt5-base meson librsvg git)
options=(debug)
source=(git+https://gitlab.freedesktop.org/freetype/freetype.git
        git+https://gitlab.freedesktop.org/freetype/freetype-demos.git
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        freetype2.sh)
sha256sums=('SKIP'
            'SKIP'
            '12c869eeba212c74d07d3d7815848b047ecb5282d5463dffb3bb6d219315d4da'
            '2497dcb3650271db9bb7ad4f3379b5b3c6a19f5ca5388dd9ba7d42b5c15c8c4f'
            'caa0bc7d3dfa3b4c6b9beecda6141405dafe540f99a655dc83d1704fa232ac20'
            '8bf978cd1abd73f54c53f7d214c368b1fd8921cd9800d2cc84427c662ffbbdcb'
            'f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467')
validpgpkeys=(E30674707856409FF1948010BE6C3AAC63AD8E3F) # Werner Lemberg <wl@gnu.org>

pkgver() {
  local _tag _count

  cd freetype
  _tag=$(git describe --abbrev=0 )
  _count=$(git rev-list --count $_tag..HEAD)
  _tag=${_tag#VER-}
  echo ${_tag//-/.}+p$_count+g$(git rev-parse --short HEAD)
}

prepare() {
  ln -sr freetype freetype-demos/subprojects/freetype2

  cd freetype
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
}

build() {
  arch-meson freetype-demos build \
    -D freetype2:default_library=shared
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_freetype2-git() {
  provides=(libfreetype.so "freetype2=$pkgver")
  conflicts=(freetype2)
  install=freetype2.install
  backup=(etc/profile.d/freetype2.sh)

  meson install -C build --destdir="$pkgdir"
  install -Dt "$pkgdir/etc/profile.d" -m644 freetype2.sh
  install -Dt "$pkgdir/usr/share/aclocal" -m644 \
    freetype/builds/unix/freetype2.m4

  _pick demos "$pkgdir"/usr/bin
  _pick demos "$pkgdir"/usr/share/man/man1
}

package_freetype2-demos-git() {
  pkgdesc="Freetype tools and demos (from git)"
  depends=(freetype2-git libx11 librsvg)
  optdepends=('qt5-base: ftinspect')
  provides=("freetype2-demos=$pkgver")
  conflicts=(freetype2-demos)
  mv demos/* "$pkgdir"
}

# vim:set sw=2 et:
