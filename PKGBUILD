# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
pkgname=atlas-celeste
pkgver=1.3.3
pkgrel=2
pkgdesc='Render and visualize paths for Celeste TASes'
url='https://github.com/jakobhellermann/Atlas'
makedepends=('git' 'rust' 'cargo' 'imagemagick')
depends=('hicolor-icon-theme' 'glibc' 'gcc-libs')
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
_archive="Atlas-$pkgver"
source=(
    "https://github.com/jakobhellermann/Atlas/archive/refs/tags/v$pkgver.tar.gz"
    "atlas.desktop"
)
sha1sums=('22bd41f79ce27178ac194ac2633e9b2c0f8276b0'
          '9921557096f013a3ef46ee24773a58e0bdb6a56e')

prepare() {
    cd "$_archive"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_archive"
    RUSTFLAGS="$RUSTFLAGS --remap-path-prefix $PWD=/" CARGO_TARGET_DIR=target cargo build --release --frozen
}

package() {
    cd "$_archive"
    install -Dm755 "target/release/atlas" "$pkgdir/usr/bin/atlas-celeste"
    install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{'256x256/apps','48x48/apps','32x32/apps','16x16/apps'}
    magick "ui/assets/icon/icon.png" -resize 256x265 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/atlas.png"
    magick "ui/assets/icon/icon.png" -resize 48x48 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/atlas.png"
    magick "ui/assets/icon/icon.png" -resize 32x32 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/atlas.png"
    magick "ui/assets/icon/icon.png" -resize 16x16 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/atlas.png"

    install -Dm 644 "../atlas.desktop" "${pkgdir}/usr/share/applications/atlas.desktop"
}
