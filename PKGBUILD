# Maintainer: John Regan <john@jrjrtech.com>
pkgname=fluux-messenger
pkgver=0.16.0
pkgrel=1
pkgdesc="A fast, modern, cross-platform XMPP client for communities and organizations."
arch=('x86_64' 'aarch64')
url="https://www.process-one.net/fluux/"
license=('AGPL-3.0-or-later')
depends=(
  'cairo'
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
  'clang'
  'git'
  'librsvg'
  'lld'
  'npm'
)
# Disabling buildflags - there are some C dependencies
# that get compiled that are particular about CFLAGS (aws-lc-rs).
options=('!buildflags')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/processone/fluux-messenger/releases/download/v${pkgver}/Fluux-Messenger_${pkgver}_source.tar.gz"
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

    # you may get an error about the Cargo.toml and lock file being
    # out of sync. If that happens you can use cargo update -w to re-sync.
    # see https://github.com/processone/fluux-messenger/issues/356
    #cargo update -w
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # using clang and lld allows for link-time optimization
    export CC=clang
    export CXX=clang++
    export LDFLAGS="-fuse-ld=lld"

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

sha512sums=(
'd8739479abd314c1d508933e4028c0b59e5ab2d25d915d744945d30426c4d3299f3e5d5ea1b2e9f1d80299272e020fbae10325801adcba12156e7d64a297c947'
)
