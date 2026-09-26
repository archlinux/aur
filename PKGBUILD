# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=spitfire
pkgver=0.5.1
pkgrel=1
pkgdesc="Tiling Wayland compositor with a live-reloadable Lua config, in the spirit of dwm"
arch=('x86_64' 'aarch64')
url="https://github.com/dani-77/spitfire"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'mesa' 'seatd' 'libinput' 'libdisplay-info'
         'pixman' 'dbus' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'wayland-protocols')
optdepends=(
  'xorg-xwayland: run X11-only apps (XWayland support)'
  'xdg-desktop-portal: file-open dialogs, notifications and other portal prompts'
  'iw: wifi widget in the bar'
  'alacritty: terminal bound to Mod4+Return in the example config'
  'greetd: use spitfire as a login-screen session'
)
backup=('etc/xdg-desktop-portal/spitfire-portals.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80e7359690852931cacc2869c7a212d9326c401e239e0caf2737a262839a0d6c')

# Smithay is pinned as a git dependency in Cargo.lock, so prepare() needs
# network access (hence git in makedepends).
prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Same feature set as the project's own `make install` and the Void
    # template (make_build_args).
    cargo build --frozen --release --features udev,xwayland
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --features udev,xwayland
}

package() {
    cd "$pkgname-$pkgver"
    # The Makefile's install target depends on build, which is a no-op here
    # since build() already produced target/release with the same features.
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
