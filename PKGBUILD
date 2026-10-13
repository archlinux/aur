# Maintainer: guiodic <guido.iodice@gmail.com>
# Contributor: ryuukk_ <ryuukk.dev@gmail.com>

pkgname=freetype2-macos
pkgver=2.15.0
pkgrel=1
pkgdesc="freetype2 with a patch to make it render text like on macOS"
url="https://www.freetype.org/"
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
  glibc

  # adding harfbuzz for improved OpenType features auto-hinting
  # introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
  harfbuzz
)
makedepends=(
  cairo
  gcc-libs
  glib2
  harfbuzz
  librsvg
  libx11
  meson
  qt6-base
)
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-long-PCF-family-names.patch
  9998-clamp.diff
  9999-macos-like.patch
  freetype2.sh
)
b2sums=('b49bbcf6eae90159b8c3f315a8175d23a0c6a8f8574361aaff1b05d19984b31c000c1d637ba128e6f2f09d984d583f36cc7dd84e196152214f6fc8bed20e810d'
        'SKIP'
        'ae576f598fd98d2088e8b9f7a964c18a7395f48c687c5c47381accf65c49760de798f0956e22f3671b8bfc85fd0ed8dbeaf2c8ccab0c3e2f812b4c4451b18f01'
        'a09b1de5c8890aeff5d020194ffd1b23ca1fa7ea0d63f840fe600194fec78b837460e312db0503d3d76896d7ef25fdf8eb28a35a1c7e70ce60359ca802ac6672'
        '45a3103bb0a26486b37926c253551c2840c2ea606ccb940aefbd0df8362a47d6d46ea343c20a38aa70b28f889e92625f84d7cee575cf6fa7e1302da5ba69890f'
        '6a6f89f5de3c9c848567bfeb0408b028e77590dfced2c9c4044f534060a1b53c08ea29043425fe2612b20004a5507370a98e5c3ad50da127c10a05591866f32c'
        'b5301c02e57d4f99c05263967833d2578b24b8eb5e4fda3809ba79f1bc4bc01ef53eb762546ff39cae43aeac734752e5e992c65ef89ab8bfff43557457bf5f4e'
        '95c72d77b2e8d0cf3443713741c5f06177b6ba6eabbdb39537ca07d5550909218d4f4e6e71c7fe9bfd175fb6ba3c4f8304c59aaa5c4f411a3c46d56b8bca385f')
validpgpkeys=(
  E30674707856409FF1948010BE6C3AAC63AD8E3F  # Werner Lemberg <wl@gnu.org>
)

prepare() {
  cd freetype-$pkgver
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../9998-clamp.diff #necessary for macos-like.patch
  patch -Np1 -i ../9999-macos-like.patch
}

build() {
  local meson_options=(
    -D default_library=shared
    -D error_strings=true
    -D harfbuzz=dynamic
    -D hvf=disabled
  )

  arch-meson freetype-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_freetype2-macos() {
  provides=(freetype2 libfreetype.so)
  conflicts=(freetype2)
  install=freetype2.install
  backup=(etc/profile.d/freetype2.sh)

  meson install -C build --destdir="$pkgdir"
  install -Dt "$pkgdir/etc/profile.d" -m644 freetype2.sh
  install -Dt "$pkgdir/usr/share/aclocal" -m644 \
    freetype-$pkgver/builds/unix/freetype2.m4
}

# vim:set sw=2 sts=-1 et:
