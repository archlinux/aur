# Maintainer: earthintruders <<earthintruders at tutanota dot de>>
pkgname=qobine-git
pkgver=v2026.07.31.r0.ga628f39
pkgrel=1
pkgdesc="High resolution audio player backed by Qobuz (git-version). Formaly known as qobuz-player"
arch=('x86_64')
url="https://github.com/SofusA/qobine"
license=('GPL-3.0')
replaces=('qobuz-player-git')
conflicts=('qobine')
depends=('alsa-lib' 'gtk4' 'libadwaita' 'webkitgtk-6.0' 'pango' 'gdk-pixbuf2' 'graphene')
makedepends=('protobuf' 'cargo' 'nodejs' 'npm' 'sqlx-cli')
optdepends=('ttf-font-nerd: glyph support')
source=("qobine-git::git+https://github.com/SofusA/qobine.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  cd qobuz-player-web
}

prepare() {
    cd ${pkgname}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
    cd web-module
    npm install
}

build() {
    cd ${pkgname}
    #refuses to work with clang
    export CC=gcc
    export CXX=g++
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
    cd ${pkgname}

    # Install the binaries for the players
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{qobine-gtk,qobine-tui,qobine-web}
    # Install the binaries for the disconnect service
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{qobine-connect,disconnect-server}

}
