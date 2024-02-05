# Maintainer: crimist <aur at crim dot ist>

pkgname=freetype2-qdoled
pkgver=2.13.2
pkgrel=2
pkgdesc="freetype optimized for QD-OLED subpixel layout"
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
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz
  0001-Enable-table-validation-modules.patch
  0003-Enable-long-PCF-family-names.patch
  0004-QD-OLED-subpixel.patch
  freetype2.sh
)
b2sums=('cebc82180d9afaeb112a65ba78903d7bf7a9295a803166a033585ad2325add6023f05066852240c4665e56285345ba503b01ecd461d48f0478a8f3f56136988e'
        '2c148694e150b3faae9dc46ead824ae6d94cfe34f2918bc9066f45bab7e6b6f77b4d4b2fee00c3d466d866e1985132cea4a774dcf1bab95409b7cf55efff01e1'
        '66deb179d1f1f4e2e35f6d50acfbacce80595d5128f5fed8c1871838c210dbf1a7173a87dd937d64997844c8f478c8f81120f71e33b9d59d980e179d103ff31c'
        '3589553233a16079fb0a7fd68765b8a78e14b25eb83ac1866ce451be3adf06a01fea5d704a01e610261edb351041323dd7441f2af31104d44f70cc12436a9cc7'
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
  install -Dt "$pkgdir/etc/profile.d" -m644 freetype2.sh
  install -Dt "$pkgdir/usr/share/aclocal" -m644 \
    freetype-$pkgver/builds/unix/freetype2.m4
}
