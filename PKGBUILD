# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# omnifrog — re-voices a spatial-audio film with the dialogue of its dubbed
# track: the original's objects and bed are kept, the dub's voices are lifted
# out by a separation model and placed among them, and the result is encoded
# again. The command line (omnifrog) and the window (omnifrog-gui).
#
# A run drives tools this package does not build: ffmpeg and mkvmerge always,
# the harletty decoder (shipped by harletty-bridge), an encoder (harlettizer),
# and a Python 3.11 or 3.12 for the separation, which `omnifrog setup` turns
# into a venv with torch and MSST under ~/.local/share/omnifrog.

pkgname=omnifrog
pkgver=0.1.0
pkgrel=1
pkgdesc="Re-voices a spatial-audio film with the dialogue of its dubbed track"
arch=('x86_64')
url="https://github.com/mgth/omnifrog"
license=('GPL-3.0-or-later')
# The window opens the display's libraries at run time (EGL, Wayland, X11,
# xkbcommon) rather than linking them.
depends=('gcc-libs' 'glibc' 'ffmpeg' 'mkvtoolnix-cli' 'hicolor-icon-theme'
         'libglvnd' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('harletty-bridge: the harletty decoder every run starts with'
            'harlettizer: the encoder (encoder: hz, iamf, iamf-lit)'
            'python312: a Python setup can build the separation venv from (3.11 also works)'
            'python311: a Python setup can build the separation venv from'
            'xdg-desktop-portal: the file dialogs of the window')
makedepends=('cargo')
# !lto: makepkg's -flto CFLAGS turn the C that ring (TLS, for the model
# downloads) compiles with cc into GCC bitcode the Rust linker cannot read.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83fd9ecb23c4243fc965b7587368de1e1f93e5a2ce59219c4ef690e1f77e5175')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    # Keep $srcdir out of the binaries (panic-location paths).
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=src"
    # The command line and the window; the test bench is a development tool.
    cargo build --frozen --release -p omnifrog-cli -p omnifrog-gui
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen --release -p omnifrog-core -p omnifrog-cli
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/omnifrog target/release/omnifrog-gui -t "$pkgdir/usr/bin/"
    install -Dm644 packaging/linux/omnifrog.desktop "$pkgdir/usr/share/applications/omnifrog.desktop"
    install -Dm644 packaging/linux/omnifrog.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/omnifrog.svg"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
