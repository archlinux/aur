# Maintainer: Ethan Stokes <erstokes10@gmail.com>
# Rendered from packaging/aur/blockwork/PKGBUILD.in in Blockworked/Blockwork by .github/workflows/aur.yml.

pkgname=blockwork
pkgver=0.6.3
pkgrel=1
pkgdesc='Build keyboard and mouse macros by snapping blocks together'
url='https://blockworked.com'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'hicolor-icon-theme' 'gcc-libs' 'glibc' 'dbus' 'libxkbcommon' 'wayland' 'gtk3')
makedepends=('cargo' 'cmake' 'clang' 'lld' 'pkgconf')
optdepends=('qt6-wayland: native Wayland window'
            'tesseract: text recognition blocks'
            'grim: screen blocks on wlroots desktops'
            'kdotool: window blocks on KDE Plasma')
provides=('macros')
conflicts=('blockwork-bin' 'blockwork-git' 'macros')
options=('!lto')
_qwk=2072958b04820e9e7629f6c40068dee0ce0e9915
source=("$pkgname-$pkgver.tar.gz::https://github.com/Blockworked/Blockwork/archive/refs/tags/$pkgver.tar.gz"
        "qwindowkit-$_qwk.tar.gz::https://codeload.github.com/stdware/qwindowkit/tar.gz/$_qwk")
sha256sums=('d8f7e141f4b9746f4cf33eff8d5473048049f0b96420d6fac3896d8ca8731b77'
            '82cf5292b7f39729f2d40f63cee340dd77aea3c402d04df735c23b76f98c822c')

prepare() {
    cd "Blockwork-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "Blockwork-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_NET_OFFLINE=true
    export QMAKE=/usr/bin/qmake6
    # GNU ld with --as-needed drops Qt libraries only the cxx-qt archives use; rustup's Rust links with lld too.
    export RUSTFLAGS="${RUSTFLAGS:-} -Clink-arg=-fuse-ld=lld"
    export BLOCKWORK_QWINDOWKIT_SOURCE_DIR="$srcdir/qwindowkit-$_qwk"
    cargo build --release --frozen --workspace --exclude blockwork-linux-bridge
}

package() {
    cd "Blockwork-$pkgver"
    packaging/linux/install.sh "$pkgdir" /usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
