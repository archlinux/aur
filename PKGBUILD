# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-video-player-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell video player: hardware decoding, subtitles, neural upscaling and frame interpolation'
depends=('synshell-core' 'ffmpeg')
provides=('syn-video-player')
conflicts=('syn-video-player' 'syn-video-player-bin')
groups=('synshell-apps')
makedepends=('cargo' 'rust' 'git' 'clang' 'pkgconf' 'mesa' 'libinput' 'seatd' 'libxkbcommon' 'libdrm' 'fontconfig' 'freetype2' 'dbus' 'sqlite' 'libarchive' 'pipewire' 'alsa-lib' 'fuse3')
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
    cargo build --offline --release -p syn-video-player
}

package() {
    local _root="$srcdir/synshell" _bins="$srcdir/synshell/target/release"
    cd "$_root"
    install -Dm755 "$_bins/syn-video-player" "$pkgdir/usr/bin/syn-video-player"
    install -Dm644 'crates/syn-video-player/data/syn-video-player.desktop' "$pkgdir/usr/share/applications/syn-video-player.desktop"
    install -Dm644 'crates/syn-video-player/data/icons/syn-video-player.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/syn-video-player.svg"
    install -dm755 "$pkgdir/usr/share/fonts/synshell/"
    for _f in crates/syn-video-player/data/fonts/*.ttf; do
        [ -e "$_f" ] || { echo "нет crates/syn-video-player/data/fonts/*.ttf" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/fonts/synshell/"; else install -m644 "$_f" "$pkgdir/usr/share/fonts/synshell/"; fi
    done
    install -Dm644 'crates/syn-video-player/data/fonts/OFL.txt' "$pkgdir/usr/share/licenses/syn-video-player/fonts-OFL.txt"
}
