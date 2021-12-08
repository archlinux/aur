# Maintainer: Daniel Eklöf <daniel at ekloef dot se>

GRAPHEME_SHAPING=enabled   # auto|disabled|enabled
RUN_SHAPING=enabled        # auto|disabled|enabled

pkgname=fcft
pkgver=2.5.1  # Don’t forget to update CHANGELOG.md
pkgrel=1
pkgdesc="Simple library for font loading and glyph rasterization using FontConfig, FreeType and pixman."
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
depends=('freetype2' 'fontconfig' 'pixman')
makedepends=('meson' 'ninja' 'scdoc' 'tllist')
checkdepends=('check' 'ttf-dejavu')
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('1b9e9346c884f16bce9548806ea89c5e34ccc98ce27ec6ecff1f5011235de112')

if [[ ${RUN_SHAPING} == enabled ]]; then
  depends+=('harfbuzz' 'libutf8proc')
elif [[ ${GRAPHEME_SHAPING} == enabled ]]; then
  depends+=('harfbuzz')
fi

build() {
  cd ${pkgname}

  meson \
    --prefix=/usr \
    --buildtype=release \
    -Dgrapheme-shaping=${GRAPHEME_SHAPING} \
    -Drun-shaping=${RUN_SHAPING} \
    . build
  ninja -C build
}

check() {
  cd ${pkgname}
  ninja -C build test
}

package() {
  cd ${pkgname}
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 unicode/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.unicode"
}
