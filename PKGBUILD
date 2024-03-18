# Maintainer: ryuukk_ <ryuukk.dev@gmail.com>
# Contributor: ryuukk_ <ryuukk.dev@gmail.com>

pkgname=freetype2-macos
pkgver=2.13.2
pkgrel=1
epoch=
pkgdesc="freetype2 with a patch to make it render text like on macOS"
url="https://www.freetype.org/"
conflicts=(freetype2)
arch=(
  x86_64
)
license=(GPL)
depends=(
  brotli
  bzip2
  libpng
  sh
  zlib

  # adding harfbuzz for improved OpenType features auto-hinting
  # introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
  harfbuzz
)
makedepends=(
  librsvg
  libx11
  meson
  qt5-base
)
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-long-PCF-family-names.patch
  9999-macos-like.patch
  freetype2.sh
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')
validpgpkeys=(
)

prepare() {
  # Build FreeType as part of the demos
  ln -sr freetype-$pkgver ft2demos-$pkgver/subprojects/freetype2

  cd freetype-$pkgver
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../9999-macos-like.patch
}

build() {
  local meson_options=(
    -D freetype2:default_library=shared
  )

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_freetype2-macos() {
  provides=(
    libfreetype.so
  )
  install=freetype2.install
  backup=(etc/profile.d/freetype2.sh)

  meson install -C build --destdir="$pkgdir"
  install -Dt "$pkgdir/etc/profile.d" -m644 freetype2.sh
  install -Dt "$pkgdir/usr/share/aclocal" -m644 \
    freetype-$pkgver/builds/unix/freetype2.m4
}

# vim:set sw=2 sts=-1 et:
