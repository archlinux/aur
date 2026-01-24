# Maintainer: Ahmet Yildirim <ahmetyildirim@protonmail.com>
pkgname=md-viewer-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, lightweight markdown viewer for Linux with tabs, file explorer, and live reload"
arch=('x86_64')
url="https://github.com/aydiler/md-viewer"
license=('MIT')
depends=(
    'gcc-libs'
    'libxcb'
    'libxkbcommon'
    'openssl'
    'gtk3'
    'fontconfig'
    'dbus'
)
makedepends=(
    'rust'
    'cargo'
    'clang'
    'pkg-config'
)
optdepends=(
    'zenity: native file dialogs'
    'xdg-desktop-portal: file dialogs on Wayland'
    'xdg-desktop-portal-gtk: GTK portal backend'
)
provides=('md-viewer')
conflicts=('md-viewer')
source=("${pkgname}::git+https://github.com/aydiler/md-viewer.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/md-viewer" "$pkgdir/usr/bin/md-viewer"
    install -Dm644 "data/md-viewer.desktop" "$pkgdir/usr/share/applications/md-viewer.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
