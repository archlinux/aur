# Maintainer: peri <[name] at periwinkle dot sh>
pkgname=hail
pkgver=0.4.0
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
sha256sums=('4c2c26ff2a9990714fea80f070e79f4a27b01adf680f9e4dc9f1e32470377677'
            '59ee22051362a35f081747901f1319ec28108ceb51d1c572889f37cad51d1a82')

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
