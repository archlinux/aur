# Maintainer: Adiker

pkgname=freetype2-qdoled-gen3
pkgver=2.14.3
pkgrel=1
pkgdesc="freetype optimized for QD-OLED Gen3 panels (like AW2725D) subpixel layout"
url="https://www.freetype.org/"
arch=(x86_64)
license=('FTL OR GPL-2.0-or-later')
depends=(
  brotli
  bzip2
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
  qt5-base
)
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz
  0001-Enable-table-validation-modules.patch
  0003-Enable-long-PCF-family-names.patch
  0004-QD-OLED-subpixel.patch
  freetype2.sh
)
b2sums=('26db1946b099abc73d9d249dc48303e70886e0b1cb7180d5b9538b3934dc677a1572a32573af6adabeeb1c1a2eef81f24399038d3d8e640c29bba77f6c8a3596'
        'b7e3b72e2d6aed548c1762a16ee08ac47a05caf29c5d37ef03c6791e6dbd109fdfef0b246540c35e968d54f2103b70e80eccff72ac54d34224c6d064aa53d720'
        'b83a599da8eef1c39a268482db8e82f03a2c9b68850a0ec782e9839e7b45a3b0f989d997647eb55e5b18f2fe0c988e73f0ec6c4eb4c0787689f9e0213faa4320'
        'd1620e2d1501833244b712e3bec2dff9324fa353d3cda41d568f52adf8b093ac6ccbe56acd98a3fbd7dff3d47bf57d6afbdaea39fe8dc02a6685eb5b4f1481cb'
        'a964f46886b5017a5c180f29408f72ae8aba29f37404c48b4681ff12ca0a2cfa2a8e219480e98d63d45fb5c266a6e5826df170c9a0d701cd866e395c5ac6e87d')

prepare() {
  cd freetype-$pkgver
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../0004-QD-OLED-subpixel.patch
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
  install=freetype2.install
  backup=(etc/profile.d/freetype2.sh)

  meson install -C build --destdir="$pkgdir"

  install -Dm644 freetype2.sh -t "$pkgdir/etc/profile.d"

  install -Dm644 freetype-$pkgver/docs/FTL.TXT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
