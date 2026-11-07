# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synpass-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell password manager'
depends=('synshell-core')
provides=('synpass')
conflicts=('synpass' 'synpass-bin')
groups=('synshell-apps')
makedepends=('cargo' 'rust' 'git' 'clang' 'pkgconf' 'mesa' 'libinput' 'seatd' 'libxkbcommon' 'libdrm' 'fontconfig' 'freetype2' 'dbus' 'ffmpeg' 'sqlite' 'libarchive' 'pipewire' 'alsa-lib' 'fuse3')
options=('!lto')
source=("synshell::git+https://github.com/VitaminDB/synshell.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/synshell"
    if git describe --tags >/dev/null 2>&1; then
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf '%s.r%s.g%s' '0.2.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$srcdir/synshell"
    export RUSTUP_TOOLCHAIN=stable
    # Без --locked: git-зависимости (syngui и др.) свежие, Cargo.lock обновится.
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/synshell"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --offline --release -p syn-pass
}

package() {
    local _root="$srcdir/synshell" _bins="$srcdir/synshell/target/release"
    cd "$_root"
    install -Dm755 "$_bins/synpass" "$pkgdir/usr/bin/synpass"
    install -Dm644 'crates/syn-pass/data/synpass.desktop' "$pkgdir/usr/share/applications/synpass.desktop"
    install -Dm644 'crates/syn-pass/data/icons/synpass.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/synpass.svg"
}
