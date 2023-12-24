# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-wps
pkgver=2.13.2
pkgrel=1
epoch=
pkgdesc="Font rasterization library, fix fakebold render issue for Kingsoft Office (WPS Office) when freetype2>2.13.0."
url="https://www.freetype.org/"
arch=(
  x86_64
)
license=(GPL)
depends=(
  wps-office
)
makedepends=(
  librsvg
  libx11
  meson
  qt5-base
)
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
  0000-WPS-compatiblity.patch::https://gitlab.freedesktop.org/freetype/freetype/-/merge_requests/304/diffs.patch
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-long-PCF-family-names.patch
)
b2sums=('cebc82180d9afaeb112a65ba78903d7bf7a9295a803166a033585ad2325add6023f05066852240c4665e56285345ba503b01ecd461d48f0478a8f3f56136988e'
        'SKIP'
        '42e53690cae9930fdfc819ecbce578619b4bbc75faab247dc09394abaf768d58cc9b8314f5bb22e11a991611135d50bd364c1b45d1f871e26b82dbadda99657c'
        '2c148694e150b3faae9dc46ead824ae6d94cfe34f2918bc9066f45bab7e6b6f77b4d4b2fee00c3d466d866e1985132cea4a774dcf1bab95409b7cf55efff01e1'
        '9598d13eae0411878c1af8e5d875c3b1fc09f4e6649edfbbf3b0a819c4c585648521f0b30ffd1318f5106cfde9c899d3db70c8ffe36dac59f3f98b5fd7dab115'
        '66deb179d1f1f4e2e35f6d50acfbacce80595d5128f5fed8c1871838c210dbf1a7173a87dd937d64997844c8f478c8f81120f71e33b9d59d980e179d103ff31c')
validpgpkeys=(
  E30674707856409FF1948010BE6C3AAC63AD8E3F  # Werner Lemberg <wl@gnu.org>
)

prepare() {
  cd freetype-$pkgver
  patch -Np1 -i ../0000-WPS-compatiblity.patch
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
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

package() {
  install -Dt "$pkgdir/usr/lib/office6" -m644 build/libfreetype.so.6
}

# vim:set sw=2 sts=-1 et:
