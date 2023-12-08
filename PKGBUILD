# Maintainer: seiuneko <chfsefefgesfen foxmail>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-wps
pkgver=2.13.0
pkgrel=1
pkgdesc="fix fakebold render issue for Kingsoft Office (WPS Office) when freetype2>2.13.0."
url="https://www.freetype.org/"
arch=(x86_64)
license=(GPL)
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=(
  wps-office
)
makedepends=(
  librsvg
  libx11
  meson
)
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-infinality-subpixel-hinting.patch
  0004-Enable-long-PCF-family-names.patch
  0005-builds-meson-parse_modules_cfg.py-Handle-gxvalid-and.patch
)
sha256sums=('5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c'
            'SKIP'
            'd279a9d4b2c146722dbc03f9a33009846efe8bbbe3ada52beb4a1aa4d4dfaa38'
            'f2e8a16126723458b413e58da267fb30332d0b42fef972f951e3e9fc081fa492'
            '8e61d12ebdbbcb764a38d4798ee728074bac0aa20978d538b6e7045a63949ab8'
            'cc364cc0ca21b8b30f29d90ab394d82f3303ca7d9813d866e6bf14f9bccd9564'
            '08cf087d7d612b4228e24d74df95cf1f397f7c41054c42837c63c1f33ffaee09')
validpgpkeys=(E30674707856409FF1948010BE6C3AAC63AD8E3F) # Werner Lemberg <wl@gnu.org>

prepare() {
  cd freetype-$pkgver
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../0005-builds-meson-parse_modules_cfg.py-Handle-gxvalid-and.patch
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
