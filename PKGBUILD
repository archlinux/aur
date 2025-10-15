# Maintainer: Simon Repp <simon@fdpl.io>

arch=('aarch64' 'x86_64')
conflicts=('hyper8-bin' 'hyper8-cli')
depends=(
    # hyper8-core dependencies
    'ffmpeg'
    'rsync'
    # hyper8-desktop dependencies
    'cairo'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup'
    'pango'
    'webkit2gtk-4.1'
)
license=('AGPL3')
makedepends=(
    # hyper8-core dependencies
    'cargo'
    'cmake'
    'git'
    # Tauri dependencies
    'appmenu-gtk-module'
    'libappindicator-gtk3'
    'librsvg'
    'openssl'
)
options=('!lto')
pkgdesc='A static site generator for video publishing'
pkgname=hyper8
pkgrel=1
pkgver=1.0.0
provides=('hyper8')
sha256sums=('6786c2b4bad6b5f70d6859a55a17e47905209cebc780dd78e4bd25615988f450')
url='https://simonrepp.com/hyper8'

source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/simonrepp/hyper8/archive/${pkgver}.tar.gz")

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$pkgname"
    cargo tauri build --bundles deb
}

package() {
    # Note that "cargo tauri build …" places the target directory inside the
    # desktop crate subdirectory (adjacent to tauri.conf.json) for reasons
    # unknown, hence we copy from there
    cp -a ${srcdir}/${pkgname}/desktop/target/release/bundle/deb/Hyper\ 8_${pkgver}_*/data/* "${pkgdir}"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo install tauri-cli --locked --version "^2.0.0"
}
