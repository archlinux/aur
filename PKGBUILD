pkgname=qobine
pkgver="2026.07.21"
_release_version="2026-07-21"
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz. Formaly known as qobuz-player"
arch=('x86_64')
url="https://github.com/SofusA/qobine"
license=('GPL-3.0')
replaces=('qobuz-player')
conflicts=('qobine-git')
depends=('alsa-lib' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'pango' 'gdk-pixbuf2' 'graphene')
makedepends=('protobuf' 'cargo' 'nodejs' 'npm' 'sqlx-cli')optdepends=('ttf-font-nerd: glyph support')
optdepends=('ttf-font-nerd: glyph support')
source=("qobine-${_release_version}.tar.gz::https://github.com/SofusA/qobine/archive/refs/tags/v${_release_version}.tar.gz")
sha256sums=('8beda8cf9a78ef02f97f8ed2c3649cdc04bc551dc2d8db5552f9bba89c52fe7e')
options=('!lto')

prepare() {
    cd ${pkgname}-${_release_version}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
    cd web-module
    npm install
}

build() {
    cd ${pkgname}-${_release_version}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #Build the webUI (thanks to moystard)
    cd web-module
    npm run build
    cd ..
    #Build the database
    echo 'DATABASE_URL="sqlite:///tmp/qobuz-player.db"' > .env
    cargo sqlx db create
    cargo sqlx migrate run --source player-module/migrations
    #Build the program
    cargo build --frozen --release --all-features

}

package() {
    cd ${pkgname}-${_release_version}

    # Install the binaries for the players
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{qobine-gtk,qobine-tui,qobine-web,qobine-rfid}
    # Install the binaries for the disconnect service
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{qobine-connect,disconnect-module,disconnect-server}

}
