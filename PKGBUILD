# Maintainer: peri <[name] at periwinkle dot sh>
pkgname=hail
pkgver=0.2.1
pkgrel=1
pkgdesc='A better speedrun timer'
url='https://codeberg.org/periwinkle/hail'
source=(
    "$pkgname-$pkgver.tar.gz::https://codeberg.org/periwinkle/hail/archive/$pkgver.tar.gz"
    "hail.desktop"
)
arch=('x86_64')
license=('MPL-2.0')
makedepends=('cargo')
depends=('sdl2-compat' 'sdl2_gfx' 'sdl2_image' 'freetype2' 'fontconfig' 'gcc-libs')
sha256sums=(
    '67cf779fb032e95123ee6ecf31d42d1620f5f7ebacb633ca81a30b4002f1d228'
    'SKIP'
)

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --frozen --release --target-dir target
}

package() {
  install -Dm644 hail.desktop "${pkgdir}/usr/share/applications/hail.desktop"
  install -Dm755 "$srcdir/$pkgname"/target/release/hail "${pkgdir}/usr/bin/hail"
}
