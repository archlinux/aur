# Maintainer: John Regan <john@jrjrtech.com>
pkgname=fluux-messenger
pkgver=0.13.1
pkgrel=1
pkgdesc="A fast, modern, cross-platform XMPP client for communities and organizations."
arch=('x86_64' 'aarch64')
url="https://www.process-one.net/fluux/"
license=('AGPL-3.0-or-later')
depends=(
  'cairo'
  'gcc-libs'
  'glib2'
  'glibc'
  'gdk-pixbuf2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'libx11'
  'libxss'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'librsvg'
  'npm'
)
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/processone/fluux-messenger/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '8b1eba9a59ca641ce4a334eb5e225bf7fdfb0fe3538d0b8cf2e8ebcc6bbb7ffd'
)

prepare() {
    export RUSTUP_TOOLCHAIN=stable

	cd "$pkgname-$pkgver"
    npm ci --cache "${srcdir}/npm-cache"

	cd "apps/fluux/src-tauri"
    cargo update
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

	cd "$pkgname-$pkgver"
    npm run build

    cd "apps/fluux"
    npm run tauri build -- --ci --no-bundle -- --frozen

}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 apps/fluux/src-tauri/target/release/fluux "$pkgdir"/usr/bin/fluux-messenger
    install -Dm644 packaging/debian/fluux-messenger.desktop -t "$pkgdir"/usr/share/applications/
    install -m755 -d "$pkgdir"/usr/share/icons/hicolor/512x512/apps
    rsvg-convert --width=512 --height=512 --keep-aspect-ratio assets/chat_icon.svg > "$pkgdir"/usr/share/icons/hicolor/512x512/apps/fluux-messenger.png
}
