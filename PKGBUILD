# Maintainer: envolution
# Contributor: Kyle Keen <keenerd@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=hyperrogue
# vercmp does not support upstream's versioning, so we prepend letters with '.'
# example upstream vercmp(v13.1 > v13.1a) vercmp(v13.1 < v13.1.a)
pkgver=13.1.f
_pkgver=$(sed 's/\.\([a-zA-Z]\)/\1/' <<<"$pkgver")
pkgrel=1
pkgdesc="You are a lone outsider in a strange, non-Euclidean hyperbolic world"
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hyper.php"
license=('GPL-2.0-or-later')
options=(!strip !debug)
depends=(
  'sdl_gfx'
  'sdl_ttf'
  'sdl_mixer'
  'mesa'
  'ttf-dejavu'
  'glibc'
  'libglvnd'
  'zlib'
  'sdl12-compat'
  'libpng'
  'glew'
  'fontconfig'
  'gcc-libs')
makedepends=('glu')
source=("hyperrogue-$_pkgver.tgz::https://github.com/zenorogue/hyperrogue/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('3a49067ecfb940b1c056b70d3e558db8fe3c988a62adfca11d5317255ba8b384')

build() {
  cd "$srcdir/$pkgname-${_pkgver}"
  export HYPERROGUE_USE_GLEW=1
  export HYPERROGUE_USE_PNG=1
  export FONTCONFIG=1
  export CXXFLAGS="$CXXFLAGS -DHYPERPATH='std::string(\"/usr/share/hyperrogue/\")'"
  make
}

package() {
  cd "$srcdir/$pkgname-${_pkgver}"

  install -Dm755 hyperrogue "$pkgdir/usr/bin/hyperrogue"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 contrib/hyperrogue.desktop "$pkgdir/usr/share/applications/hyperrogue.desktop"
  install -Dm644 hyperrogue-music.txt "$pkgdir/usr/share/hyperrogue/hyperrogue-music.txt"

  # icons at various resolutions
  local icon_sizes=(36x36:ldpi 48x48:mdpi 72x72:hdpi 96x96:xhdpi 144x144:xxhdpi 192x192:xxxhdpi)
  for size_dpi in "${icon_sizes[@]}"; do
    size=${size_dpi%:*}
    dpi=${size_dpi#*:}
    install -Dm644 "hyperroid/app/src/main/res/drawable-$dpi/icon.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/hyperrogue.png"
  done

  cp -r music "$pkgdir/usr/share/hyperrogue/"
  cp -r sounds "$pkgdir/usr/share/hyperrogue/"
}

# vim:set ts=2 sw=2 et:
