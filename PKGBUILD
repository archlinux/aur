# Maintainer: Ethan Stokes <erstokes10@gmail.com>
# Kept in packaging/aur/blockwork-git in Blockworked/Blockwork; .github/workflows/aur.yml
# pushes it when it changes. pkgver is worked out at build time.

pkgname=blockwork-git
pkgver=0.6.2.r0.g0000000
pkgrel=1
pkgdesc='Build keyboard and mouse macros by snapping blocks together (latest master)'
url='https://blockworked.com'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'hicolor-icon-theme' 'gcc-libs' 'glibc' 'dbus' 'libxkbcommon' 'wayland' 'gtk3')
makedepends=('git' 'cargo' 'cmake' 'clang' 'lld' 'pkgconf')
optdepends=('qt6-wayland: native Wayland window'
            'tesseract: text recognition blocks'
            'grim: screen blocks on wlroots desktops'
            'kdotool: window blocks on KDE Plasma')
provides=('blockwork' 'macros')
conflicts=('blockwork' 'blockwork-bin' 'macros')
options=('!lto')
source=("git+https://github.com/Blockworked/Blockwork.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd Blockwork
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd Blockwork
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd Blockwork
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export QMAKE=/usr/bin/qmake6
    # GNU ld with --as-needed drops Qt libraries only the cxx-qt archives use; rustup's Rust links with lld too.
    export RUSTFLAGS="${RUSTFLAGS:-} -Clink-arg=-fuse-ld=lld"
    # QWindowKit is fetched by CMake, at the commit blockwork-qt/native pins.
    cargo build --release --locked --workspace --exclude blockwork-linux-bridge
}

package() {
    cd Blockwork
    packaging/linux/install.sh "$pkgdir" /usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
