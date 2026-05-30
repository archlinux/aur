# Maintainer: crimist <aur at crim dot ist>

pkgname=freetype2-woled
pkgver=2.14.3
pkgrel=1
pkgdesc="freetype optimized for W-OLED subpixel layout"
url="https://www.freetype.org/"
arch=(x86_64)
license=('FTL OR GPL-2.0-or-later')
depends=(
  brotli
  bzip2
  glibc
  libpng
  sh
  zlib

  # creates a dependency cycle harfbuzz <-> freetype, wanted by upstream
  harfbuzz
)
makedepends=(
  librsvg
  libx11
  meson
  qt6-base
)
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz
  0001-Enable-table-validation-modules.patch
  0003-Enable-long-PCF-family-names.patch
  0004-W-OLED-subpixel.patch
  freetype2.sh
)
b2sums=('26db1946b099abc73d9d249dc48303e70886e0b1cb7180d5b9538b3934dc677a1572a32573af6adabeeb1c1a2eef81f24399038d3d8e640c29bba77f6c8a3596'
        'f45ec7d03193b446d8b46c8d981f330843a1ab2c83a91a5011cb328b26b4fc4c4b5729f32f3270018cf5ba8a162712bd0ebc2cd67f97b906e46ce293aeda466f'
        '3e9991bd945f74cc9d21c375decd90a2c1a56542e6e44f0f37723cd14bc96fbb5fe1e8ca3dfe59d485be69eb69d7dc98fb73d532413632f8be8c5f2cc419f938'
        '0af209679977bb11b24aa9a6bad4aaeeb47bd60d171e9e9639c2ed0fb862d2751a1b0e1e25181aeeae4020d2f6aedd15165c136c76b50dec6eaa91898b2df191'
        'a964f46886b5017a5c180f29408f72ae8aba29f37404c48b4681ff12ca0a2cfa2a8e219480e98d63d45fb5c266a6e5826df170c9a0d701cd866e395c5ac6e87d')

prepare() {
  cd freetype-$pkgver
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../0004-W-OLED-subpixel.patch
}

build() {
  local meson_options=(
    -D freetype2:default_library=shared
  )

  arch-meson freetype-$pkgver build "${meson_options[@]}"
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

package() {
  provides=(freetype2 libfreetype.so)
  conflicts=(freetype2)
  backup=(etc/profile.d/freetype2.sh)

  meson install -C build --destdir="$pkgdir"

  install -Dm644 freetype2.sh -t "$pkgdir/etc/profile.d"

  install -Dm644 freetype-$pkgver/docs/FTL.TXT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
