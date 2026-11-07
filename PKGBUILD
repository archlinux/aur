# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-audio-recorder-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell voice recorder'
depends=('synshell-core')
provides=('syn-audio-recorder')
conflicts=('syn-audio-recorder' 'syn-audio-recorder-bin')
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
    cargo build --offline --release -p syn-audio-recorder
}

package() {
    local _root="$srcdir/synshell" _bins="$srcdir/synshell/target/release"
    cd "$_root"
    install -Dm755 "$_bins/syn-audio-recorder" "$pkgdir/usr/bin/syn-audio-recorder"
    install -Dm644 'crates/syn-audio-recorder/data/syn-audio-recorder.desktop' "$pkgdir/usr/share/applications/syn-audio-recorder.desktop"
    install -Dm644 'crates/syn-audio-recorder/data/icons/syn-audio-recorder.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/syn-audio-recorder.svg"
}
