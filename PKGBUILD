# Maintainer: John Regan <john@jrjrtech.com>
pkgname=fluux-messenger
pkgver=0.13.3
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
  '9209de929abb2b739c839f3549e67969d8fa556708844cf190099e2f71e49ddc'
)
_resolutions=( 16 32 48 64 96 128 256 512 1024 )

prepare() {
    export RUSTUP_TOOLCHAIN=stable

	cd "$pkgname-$pkgver"

    for resolution in "${_resolutions[@]}" ; do
        rsvg-convert --width=$resolution --height=$resolution assets/chat_icon.svg > "$pkgname-$resolution.png"
    done

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
    install -vDm 644 assets/chat_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    for resolution in "${_resolutions[@]}" ; do
        install -vDm 644 "$pkgname-$resolution.png" "$pkgdir/usr/share/icons/hicolor/${resolution}x${resolution}/apps/$pkgname.png"
    done
}
