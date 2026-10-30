# Maintainer: onlymash <fiepi.dev@gmail.com>
pkgname=wavetune-git
_pkgname=wavetune
pkgver=r24.gc3a9917
pkgrel=1
pkgdesc="Unofficial wireless headset control center for Linux (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/onlymash/WaveTune"
license=('GPL-3.0-only')
depends=(
    'bluez'
    'bluez-libs'
    'dbus'
    'glib2'
    'glibc'
    'gtk4'
    'hicolor-icon-theme'
    'libadwaita'
    'libgcc'
    'pango'
)
optdepends=(
    'gnome-shell: GNOME Quick Settings panel integration'
    'gnome-shell-extension-appindicator: system tray icon support on GNOME'
)
makedepends=(
    'cargo'
    'git'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# LTO and symbol stripping are configured in Cargo.toml's release profile.
options=('!lto' '!debug')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    if git describe --long --tags --match 'v[0-9]*' >/dev/null 2>&1; then
        git describe --long --tags --match 'v[0-9]*' --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export XDG_CACHE_HOME="$srcdir/.cache"
    export XDG_CONFIG_HOME="$srcdir/.config"
    export XDG_DATA_HOME="$srcdir/.local/share"
    # Run headless unit/protocol tests, skipping interactive UI tests that require a display server
    cargo test --frozen --all-features -- --skip ui::
}

package() {
    cd "$_pkgname"
    sh packaging/install.sh "$pkgdir" target/release/wavetune
}
