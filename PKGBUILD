# Maintainer: sitiyou <sitiyou7@gmail.com>
#
# Builds a libass metrics module that measures text width, plus Aegisub
# scripts that use it to fix karaoke templater widths. libass is built
# statically, so the system libass stays untouched.

pkgname=aegisub-karaskel-fix
pkgver=0.17.5
pkgrel=2
# version of Aegisub whose stock automation scripts are patched
_aegisubver=3.4.2
pkgdesc="Temporary workaround that overrides Aegisub's karaskel text_extents with a libass-metrics width, fixing its inaccurate results (metrics POC #856, arch1t3cht)"
arch=(x86_64)
url=https://github.com/libass/libass
license=('ISC')
depends=(aegisub glibc fontconfig fribidi harfbuzz freetype2 libpng libunibreak)
makedepends=(git nasm autoconf automake libtool pkgconf)
source=(
  "libass-$pkgver.tar.gz::https://github.com/libass/libass/archive/refs/tags/$pkgver.tar.gz"
  "001-libass-metrics-api.patch"
  "002-libass-metrics-crashfix.patch"
  "libass_width.c"
  "libass_width.map"
  "karaskel-auto4-fix.lua"
  "kara-templater-fix.lua"
)
sha256sums=('fa286fc9ee1ba3b932703a3df7b8474d01dc8abe29ec69b6fa68781dc4bf7acc'
            '9204fb649e493426a67f5a4a8bd656d186e4a36684c66e2692facb7a85fd89d8'
            '844bb5dc06f4344bd6e7bdd112188f3b2fb3b9a58440224bda8d977ac7d116a1'
            'edaa3b714fcd1ebdedb183b3569c2a50f811895f6fdec83ef75aedf028e8ff2f'
            '628983ab3f264d43bba3806242351d3b92918e7a0fe155c3df6a85daf70311dc'
            'd1292b3054ff7972bb2c14469df88b14fffe4da696078a82637e23f74b4f485b'
            'caa93a7d45f56988a44f156755a5619eb561643cb5f96fbcc2d7679bbccea28a')

prepare() {
  cd "libass-$pkgver"
  # Apply the metrics API patch (libass#856), then the crash fix on top.
  patch -Np1 -i "$srcdir/001-libass-metrics-api.patch"
  patch -Np1 -i "$srcdir/002-libass-metrics-crashfix.patch"
  ./autogen.sh
}

build() {
  cd "libass-$pkgver"
  ./configure \
    --prefix=/usr \
    --disable-shared \
    --enable-static \
    --with-pic \
    --enable-fontconfig \
    --enable-libunibreak
  make -j"$(nproc)"

  # Build the module with static libass, hiding its symbols so they
  # don't clash with the host's libass.so.
  gcc -O2 -shared -fPIC -o "$srcdir/libass_width.so" \
      "$srcdir/libass_width.c" \
      -I"$srcdir/libass-$pkgver/libass" \
      -Wl,-Bsymbolic-functions \
      -Wl,--version-script="$srcdir/libass_width.map" \
      libass/.libs/libass.a \
      $(pkg-config --cflags --libs freetype2 harfbuzz fribidi fontconfig libpng libunibreak) -lm
}

package() {
  # Shared libass module and the -fix scripts
  install -Dm755 "$srcdir/libass_width.so" \
      "$pkgdir/usr/share/aegisub/automation/include/libass_width.so"
  install -Dm644 "$srcdir/karaskel-auto4-fix.lua" \
      "$pkgdir/usr/share/aegisub/automation/include/karaskel-auto4-fix.lua"
  install -Dm644 "$srcdir/kara-templater-fix.lua" \
      "$pkgdir/usr/share/aegisub/automation/autoload/kara-templater-fix.lua"

  install -Dm644 "$srcdir/libass-$pkgver/COPYING" \
      "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
