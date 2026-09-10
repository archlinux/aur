# Maintainer: John Regan <john@jrjrtech.com>
pkgname=fluux-messenger
pkgver=0.17.3
pkgrel=1
pkgdesc="A fast, modern, cross-platform XMPP client for communities and organizations."
arch=('x86_64' 'aarch64')
url="https://www.process-one.net/fluux-messenger/"
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
        rsvg-convert --width=$resolution --height=$resolution apps/fluux/src-tauri/icons/icon-variants/hollow/icon-source.svg > "$pkgname-$resolution.png"
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
    install -vDm 644 apps/fluux/src-tauri/icons/icon-variants/hollow/icon-source.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    for resolution in "${_resolutions[@]}" ; do
        install -vDm 644 "$pkgname-$resolution.png" "$pkgdir/usr/share/icons/hicolor/${resolution}x${resolution}/apps/$pkgname.png"
    done
}

sha512sums=(
'6c97a0afd06a612a7c5c1f33267e707fb134825be269fa57180d739d109e27ac767ad61d7b166ef7dcffbf91809d807f0be4307f5eed79578ca77eba586e6cf9'
)
