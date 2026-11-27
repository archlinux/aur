# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=spitfire
pkgver=0.8.0
pkgrel=1
pkgdesc="Tiling Wayland compositor with a live-reloadable Lua config, in the spirit of dwm"
arch=('x86_64' 'aarch64')
url="https://github.com/dani-77/spitfire"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'mesa' 'seatd' 'libinput' 'libdisplay-info'
         'pixman' 'dbus' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'wayland-protocols')
optdepends=(
  'xwayland-satellite: run X11-only apps (preferred: menus and popups behave like native ones)'
  'xorg-xwayland: run X11-only apps with the built-in XWayland support'
  'xdg-desktop-portal: file-open dialogs, notifications and other portal prompts'
  'iw: wifi widget in the bar'
  'alacritty: terminal bound to Mod4+Return in the example config'
  'greetd: use spitfire as a login-screen session'
)
backup=('etc/xdg-desktop-portal/spitfire-portals.conf')
# mlua builds its vendored Lua with makepkg's CFLAGS; with -flto those
# objects are GCC LTO bytecode that the Rust link step can't resolve
# (undefined lua_* symbols).
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c24c5b5d947b0c63303d53bd5e9324ecf8ba9d1fd095d6c11e07b91b723c9f9')

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
    # The Makefile's install target depends on target/release/spitfire,
    # already up to date here since build() produced it with the same features.
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
