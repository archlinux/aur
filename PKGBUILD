# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=fcft
pkgver=2.3.3  # Don’t forget to update CHANGELOG.md
pkgrel=1
pkgdesc="Simple library for font loading and glyph rasterization using FontConfig, FreeType and pixman."
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
depends=('freetype2' 'fontconfig' 'pixman' 'harfbuzz')
makedepends=('meson' 'ninja' 'scdoc' 'tllist')
checkdepends=('check' 'ttf-dejavu')
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('65684da7addb7a2df0bbc1b6018e6e0a08951ac7a427ec08121bbb96f98c2af4')

build() {
  cd ${pkgname}

  meson --prefix=/usr --buildtype=release -Dtext-shaping=enabled . build
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
