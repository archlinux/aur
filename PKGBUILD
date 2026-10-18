_pkgname=rivu
pkgname=rivu-git
pkgver=0.2.0.r0.ba47f81
pkgrel=1
pkgdesc='A local-first Linux music player with desktop, CLI, TUI and headless modes'
arch=('x86_64' 'aarch64')
url="https://github.com/rtgiskard/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'fontconfig' 'libpipewire>=1.2' 'libxkbcommon' 'opus' 'wayland' 'libglvnd' 'vulkan-icd-loader' 'ttf-nerd-fonts-symbols-mono' 'hicolor-icon-theme')
makedepends=('git' 'rust>=1.99' 'clang' 'pkgconf' 'ffmpeg>=9')
optdepends=('ffmpeg>=9: optional FFmpeg decoding' 'xdg-desktop-portal: desktop file chooser')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!lto')
source=("git+https://github.com/rtgiskard/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
	git -C ${_pkgname} describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd ${_pkgname}
	cargo fetch --locked
}

build() {
	cd ${_pkgname}
	RIVU_GIT_VERSION="$pkgver" cargo build --frozen --release --workspace --target-dir .cache/target
}

package() {
	cd ${_pkgname}
	install -Dm755 .cache/target/release/rivu "$pkgdir/usr/bin/rivu"
	install -Dm644 data/applications/rivu.desktop "$pkgdir/usr/share/applications/rivu.desktop"
	install -Dm644 data/icons/rivu.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rivu.svg"
	install -Dm644 data/icons/rivu.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/rivu.png"
}
