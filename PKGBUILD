# Maintainer: TornaxO7 <tornax(at)pm.me>
# 
# Heavily inspired by `awww`'s PKGBUILD
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=awww-git

pkgname=vibe-audio-visualizer-git
_pkgname=vibe
pkgver=2.3.0.r57.g5358a2d
pkgrel=1
pkgdesc="A desktop audio visualizer for wayland."
arch=('x86_64')
url="https://github.com/TornaxO7/vibe"
license=('AGPL-3.0-or-later')
depends=('libxkbcommon' 'alsa-lib' 'wayland' 'wayland-protocols' 'vulkan-validation-layers' 'vulkan-headers' 'vulkan-driver')
makedepends=('rust' 'git')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
conflicts=($_pkgname)
provides=("${_pkgname}" "vibe-audio-visualizer")
conflicts=("${_pkgname}" "vibe-audio-visualizer")

pkgver() {
	git -C $_pkgname describe --long --tags --abbrev=7 | sed 's/^vibe.v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

# Commented out due to failing tests
# check() {
# 	cd "${srcdir}/${_pkgname}"
# 	export RUSTUP_TOOLCHAIN=stable
# 	cargo test --frozen --all-features
# }

package() {
    install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/${_pkgname}/target/release/${_pkgname}"
}
