# Maintainer: temidaradev <temidaradev@proton.me>
pkgname=kopuz-nightly
# pkgver cannot hold the tag's "-", so the release's own version rides in _version.
_version=1.0.1-nightly.20261128
pkgver=1.0.1_nightly.20261128
pkgrel=1
pkgdesc="A modern music player, built nightly from the latest development code"
arch=('x86_64')
url="https://kopuz.moe"
license=('EUPL-1.2')
depends=(
    'ca-certificates'
    'alsa-lib'
    'openssl'
    'gcc-libs'
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'wayland'
    'vulkan-icd-loader'
    'fontconfig'
    'freetype2'
)
# rustup, not rust: the bundled plugins build for wasm32-wasip2, which rust-toolchain.toml pins.
makedepends=('rustup' 'pkgconf' 'cmake' 'clang')
optdepends=(
    'ffmpeg: converting YouTube downloads to MP3, FLAC or WAV'
)
options=('!lto')
source=("kopuz-nightly-$_version.tar.gz::https://github.com/Kopuz-org/kopuz/archive/refs/tags/v$_version.tar.gz")
# Filled in at publish time from the tag's source tarball.
sha256sums=('412169e619341dbddad830339e3a5b37e6e884a895dcbc57cdcf5a087f17c890')

prepare() {
    cd "kopuz-$_version"
    rustup toolchain install
    # The tag keeps the base version in Cargo.toml; release CI stamps the nightly one the same way, so the update check compares nightlies.
    sed -i "s/\"${_version%%-*}\"/\"$_version\"/g" Cargo.toml
    cargo update -w
    cargo fetch --locked
}

build() {
    cd "kopuz-$_version"
    export SQLX_OFFLINE=true
    export KOPUZ_FLAVOR=nightly
    cargo build --frozen --release -p kopuz -p kopuz-kopuzd -p kopuz-ctl
}

package() {
    cd "kopuz-$_version"
    for binary in kopuz kopuzd kopuzctl; do
        install -Dm755 "target/release/$binary" "$pkgdir/usr/bin/$binary-nightly"
    done
    install -Dm644 data/moe.kopuz.kopuz.nightly.desktop \
        "$pkgdir/usr/share/applications/moe.kopuz.kopuz.nightly.desktop"
    install -Dm644 data/moe.kopuz.kopuz.nightly.metainfo.xml \
        "$pkgdir/usr/share/metainfo/moe.kopuz.kopuz.nightly.metainfo.xml"
    install -Dm644 packaging/kopuz-nightly/logo.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/moe.kopuz.kopuz.nightly.png"
    install -Dm644 packaging/systemd/kopuzd-nightly.service \
        "$pkgdir/usr/lib/systemd/user/kopuzd-nightly.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
