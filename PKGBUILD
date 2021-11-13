# Maintainer: Daniel Eklöf <daniel at ekloef dot se>

CAIRO=enabled        # disabled|enabled
PNG_BACKEND=libpng   # none|libpng
SVG_BACKEND=librsvg  # none|librsvg|nanosvg (librsvg force-enables cairo, nanosvg is bundled)

pkgname=fuzzel
pkgver=1.6.5
pkgrel=2
pkgdesc="Application launcher for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/${pkgname}
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols' 'tllist')
depends=('libxkbcommon' 'wayland' 'pixman' 'fcft')
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('b0f1af8a4b38f0cd93722d0ec35e422b5163ec3392e16467c1af8c8de94333a0')

if [[ ${PNG_BACKEND} == libpng ]]; then
    depends+=( 'libpng' )
fi

if [[ ${SVG_BACKEND} == librsvg ]]; then
    depends+=( 'librsvg' )
    CAIRO=enabled
fi

if [[ ${CAIRO} == enabled ]]; then
    depends+=( 'cairo' )
fi

build() {
  cd ${pkgname}

  meson                          \
    --prefix=/usr                \
    --buildtype=release          \
    -Denable-cairo=${CAIRO}      \
    -Dpng-backend=${PNG_BACKEND} \
    -Dsvg-backend=${SVG_BACKEND} \
    . build
  ninja -C build
}

package() {
  cd ${pkgname}
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
