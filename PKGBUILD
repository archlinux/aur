# Maintainer: Brodino <brodino96@gmail.com>
pkgname=shy-to-text
pkgver=1.1.0
pkgrel=1
pkgdesc="A speech-to-text application using local Whisper AI models"
arch=('x86_64' 'aarch64')
url="https://github.com/Brodino96/shy-to-text"
license=('GPL-3.0')
depends=(
    'cairo'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
    'alsa-lib'
    'openblas'
)
makedepends=(
    'git'
    'openssl'
    'appmenu-gtk-module'
    'libappindicator-gtk3'
    'librsvg'
    'bun'
    'cargo'
    'cmake'
    'clang'
    'pkgconf'
    'gcc'
)
provides=('shy-to-text')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=("SKIP")

prepare() {
    cd "shy-to-text"
    bun install
}

build() {
    cd "shy-to-text"

    # Disable LTO in GGML/whisper.cpp build
    export GGML_LTO=OFF

    # Remove -flto=auto from Arch's default flags - LTO objects can't be linked by rust-lld
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    export LDFLAGS="${LDFLAGS//-flto=auto/}"

    bun run tauri build -b deb
}

package() {
    cd "shy-to-text"
    cp -a src-tauri/target/release/bundle/deb/shy-to-text_${pkgver}_*/data/* "${pkgdir}"
}
