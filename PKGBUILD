pkgname=qobine
pkgver="2026.07.31"
_release_version="2026-07-31"
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz. Formaly known as qobuz-player"
arch=('x86_64')
url="https://github.com/SofusA/qobine"
license=('GPL-3.0')
replaces=('qobuz-player')
conflicts=('qobine-git')
depends=('alsa-lib' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'pango' 'gdk-pixbuf2' 'graphene')
makedepends=('protobuf' 'cargo' 'nodejs' 'npm' 'sqlx-cli')
optdepends=('ttf-font-nerd: glyph support')
source=("qobine-${_release_version}.tar.gz::https://github.com/SofusA/qobine/archive/refs/tags/v${_release_version}.tar.gz")
sha256sums=('702b0ceb99a4c5ceb702dc0ff79360d87e37a1ba5699b2af549d1be7649e80d2')
options=('!lto')

prepare() {
    cd "${pkgname}-${_release_version}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
    cd web-module
    npm install
}

build() {
    cd "${pkgname}-${_release_version}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #Build the webUI (thanks to moystard)
    cd web-module
    npm run build
    npm run build-assets
    cd ..
    #Build the database
    export DATABASE_URL="sqlite:///tmp/qobuz-player.db"
    cargo sqlx db create
    cargo sqlx migrate run --source player-module/migrations
    #Build the program
    cargo build --frozen --release
}

package() {
    cd ${pkgname}-${_release_version}

    # Install the binaries for the players
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{qobine-gtk,qobine-tui,qobine-web}
    # Install the binaries for the disconnect service
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{qobine-connect,disconnect-server}

}
