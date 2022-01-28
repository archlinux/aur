# Maintainer: Daniel Eklöf <daniel at ekloef dot se>

CAIRO=enabled        # disabled|enabled
PNG_BACKEND=libpng   # none|libpng
SVG_BACKEND=librsvg  # none|librsvg|nanosvg (librsvg force-enables cairo, nanosvg is bundled)

pkgname=fuzzel-git
provides=('fuzzel')
conflicts=('fuzzel')
pkgver=1.6.5
pkgrel=1
pkgdesc="Application launcher for wlroots based Wayland compositors"
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/fuzzel
license=(mit)
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols' 'tllist')
depends=('libxkbcommon' 'wayland' 'pixman' 'fcft')
source=("git+https://codeberg.org/dnkl/fuzzel.git")
sha256sums=("SKIP")

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
  cd fuzzel

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
  cd fuzzel
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
