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
b2sums=('cebc82180d9afaeb112a65ba78903d7bf7a9295a803166a033585ad2325add6023f05066852240c4665e56285345ba503b01ecd461d48f0478a8f3f56136988e'
        'SKIP'
        '2c148694e150b3faae9dc46ead824ae6d94cfe34f2918bc9066f45bab7e6b6f77b4d4b2fee00c3d466d866e1985132cea4a774dcf1bab95409b7cf55efff01e1'
        '9598d13eae0411878c1af8e5d875c3b1fc09f4e6649edfbbf3b0a819c4c585648521f0b30ffd1318f5106cfde9c899d3db70c8ffe36dac59f3f98b5fd7dab115'
        '66deb179d1f1f4e2e35f6d50acfbacce80595d5128f5fed8c1871838c210dbf1a7173a87dd937d64997844c8f478c8f81120f71e33b9d59d980e179d103ff31c'
        'b5301c02e57d4f99c05263967833d2578b24b8eb5e4fda3809ba79f1bc4bc01ef53eb762546ff39cae43aeac734752e5e992c65ef89ab8bfff43557457bf5f4e'
        '95c72d77b2e8d0cf3443713741c5f06177b6ba6eabbdb39537ca07d5550909218d4f4e6e71c7fe9bfd175fb6ba3c4f8304c59aaa5c4f411a3c46d56b8bca385f')
validpgpkeys=(
  E30674707856409FF1948010BE6C3AAC63AD8E3F  # Werner Lemberg <wl@gnu.org>
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
