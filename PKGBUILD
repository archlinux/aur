# Maintainer: Da Chen <dachen@connect.hku.hk>

pkgname=alter-launcher
_srcname=alter
pkgver=0.1.2
pkgrel=1
options=(!lto)
pkgdesc="Fast Wayland launcher, global search and clipboard history for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/yuukidach/alter"
license=('MIT')
depends=(
    'curl'
    'gtk4'
    'gtk4-layer-shell'
    'wl-clipboard'
    'xdg-utils'
)
makedepends=('cargo' 'pkgconf')
optdepends=(
    'clipse: image and file clipboard history'
    'fd: fallback file search when plocate is unavailable'
    'hyprland: supported Wayland compositor and global shortcuts'
    'plocate: fast indexed file search'
)
provides=("alter=$pkgver")
conflicts=('alter' 'alter-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# The release workflow always replaces SKIP with the tag archive SHA-256 before
# generating .SRCINFO or pushing to AUR.
sha256sums=('595be04858f03b2cfc60aa8fea493c523210dd30412ee333ef7f41660b7ac669')

prepare() {
    cd "$_srcname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$_srcname-$pkgver"
    # Arch's makepkg enables linker LTO globally.  libsqlite3-sys supplies a
    # static C archive, which LLVM's LTO linker can occasionally drop before
    # resolving rusqlite's symbols; disable only Cargo's LTO for this package.
    CARGO_PROFILE_RELEASE_LTO=false cargo build --frozen --release
}

check() {
    cd "$_srcname-$pkgver"
    CARGO_PROFILE_RELEASE_LTO=false cargo test --frozen --release
}

package() {
    cd "$_srcname-$pkgver"

    install -Dm755 target/release/alter "$pkgdir/usr/bin/alter"
    install -Dm644 alter.desktop \
        "$pkgdir/usr/share/applications/alter.desktop"
    install -Dm644 resources/alter_icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/alter.png"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
