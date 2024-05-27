# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
pkgname=hades2-savefile-editor
pkgver=1.0.0
pkgrel=1
pkgdesc='Savefile Editor for the game Hades II'
url='https://github.com/jakobhellermann/hades2-tools'
license=('MIT')
makedepends=('git' 'rust' 'cargo' 'gendesk' 'imagemagick')
depends=('hicolor-icon-theme' 'glibc' 'gcc-libs')
arch=('x86_64' 'armv7h' 'aarch64')
_archive="hades2-tools-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('f1bfbbcfa5827ab02f1b773b777c81e859caebfa8f40d4b98bd0f6337f8f4134')

prepare() {
    cd "$_archive"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

   	gendesk -q -f -n \
		--name 'Hades II Savefile Editor' \
		--exec 'hades2-savefile-editor' \
		--pkgname "$pkgname" \
		--pkgdesc "$pkgdesc" \
		--categories Utility
}

build() {
    cd "$_archive"
    RUSTFLAGS="$RUSTFLAGS --remap-path-prefix $PWD=/" CARGO_TARGET_DIR=target cargo build --package hades2-savefile-editor --release --frozen
}

package() {
    cd "$_archive"

    icon="crates/hades2-savefile-editor/assets/icon.png"
    bin=hades2-savefile-editor

    install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
    install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"


    mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{'256x256/apps','48x48/apps','32x32/apps','16x16/apps'}
    magick convert "$icon" -resize 256x265 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$bin.png"
    magick convert "$icon" -resize 48x48 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/$bin.png"
    magick convert "$icon" -resize 32x32 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/$bin.png"
    magick convert "$icon" -resize 16x16 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/$bin.png"

    install -Dm 644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
}
