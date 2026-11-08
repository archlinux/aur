_pkgname=rivu
pkgname=rivu-git
pkgver=0.2.17.r7.9e8efa4c
pkgrel=1
pkgdesc='a lightweight, local-first linux music player'
arch=('x86_64' 'aarch64')
url="https://github.com/rtgiskard/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'fontconfig' 'libpipewire>=1.2' 'libxkbcommon' 'wayland' 'libglvnd' 'vulkan-icd-loader' 'ttf-nerd-fonts-symbols-mono' 'hicolor-icon-theme')
makedepends=('git' 'rust>=1.99' 'clang' 'cmake' 'pkgconf' 'ffmpeg>=9')
optdepends=('ffmpeg>=9: optional FFmpeg decoding' 'onnxruntime>=1.23: native ONNX speech inference' 'xdg-desktop-portal: desktop file chooser' 'python: neural audio-processing model setup' 'uv: isolated neural audio-processing Python environments')
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
	make install-only PREFIX=/usr DESTDIR="$pkgdir" CARGO_TARGET_DIR=.cache/target
}
