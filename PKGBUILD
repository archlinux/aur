# Maintainer: Ender Shiru <endershiru@outlook.com>
pkgname=wavey-launcher-git
_pkgname="${pkgname%-git}"
pkgver=1.0.1.23d813f
pkgrel=1
epoch=
pkgdesc="A launcher for a specific anime game with auto-patching, discord rpc and time tracking"
arch=("x86_64")
url="https://github.com/literallyfiro/wavey-launcher/tree/new-patch"
license=("GPL3")
groups=()
depends=(
    "libadwaita"
    "xdg-desktop-portal"
    "git"
    "gtk4"
    "glibc"
    "gst-plugins-base"
    "gst-plugins-good"
    "gst-plugins-bad"
    "gst-libav"
)
makedepends=("cargo" "git")
optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)
provides=(wavey-launcher)
conflicts=(wavey-launcher-bin)
source=(
    "git+https://github.com/literallyfiro/wavey-launcher.git"
    "icon.png"
    "wavey-launcher.desktop"
)

md5sums=('SKIP'
         '04741898d8f21b114b9a7c18ba62771e'
         '5487551441586e85bc5fa795a63fd4e8')


prepare() {
	cd $_pkgname
	git switch new-patch
	git pull
	git submodule update --init --recursive --single-branch
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --target-dir target
}

package() {
	cd $_pkgname

    install -Dm755 target/release/wavey-launcher "${pkgdir}/usr/bin/wavey-launcher"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/wavey-launcher.png"
    install -Dm644 "${srcdir}/wavey-launcher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/moe.launcher.wavey-launcher.png"
}
