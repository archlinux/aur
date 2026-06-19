pkgname=qobine
pkgver="2026.06.17"
_release_version="2026-06-17"
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz. Formaly known as qobuz-player"
arch=('x86_64')
url="https://github.com/SofusA/qobine"
license=('GPL-3.0')
replaces=('qobuz-player')
conflicts=('qobine-git')
depends=(alsa-lib)
makedepends=(protobuf cargo pango gdk-pixbuf2 graphene gtk4 webkitgtk-6.0 libadwaita nodejs npm sqlx-cli)
optdepends=('ttf-font-nerd: glyph support')
source=("qobine-${_release_version}.tar.gz::https://github.com/SofusA/qobine/archive/refs/tags/v${_release_version}.tar.gz")
sha256sums=('3c9c7134b37d456cad186beb6bf223ef522b2542e51b4e0a56d26c8aaf218cb4')
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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/qobuz-player"
}
