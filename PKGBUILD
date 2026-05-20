# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-git"
pkgver=26.5.3.r1401.g63c389a
pkgrel=1
pkgdesc='A simple third-party Jellyfin client for Linux'
arch=('x86_64')
url="https://github.com/tsukinaha/tsukimi"
license=('GPL-3.0-or-later')
provides=('tsukimi' 'tsukimi-git')
conflicts=('tsukimi')
depends=('mpv'
	'ffmpeg'
	'libadwaita'
	'gstreamer'
	'gtk4')
makedepends=(
	'git'
	'clang'
	'lld'
	'llvm'
	'rustup'
	'cargo')
source=(
	tsukimi::git+https://github.com/tsukinaha/tsukimi.git
	tsukimi.desktop
	tsukimi.svg
)
sha256sums=('SKIP'
            'd12dc777bbb05ed92d75f8d36e453b651e12596ead6e297386419a24d051a0a3'
            'fb9a2a0553e6515221a63edec63cec230ee837ca48eb1f91f2d8f085c3580071')

pkgver() {
	cd "${_pkgname}"
	echo $(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2).r$(git rev-list --count HEAD).g$(git rev-parse --short=7 HEAD)
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git remote update
	git submodule update --init --recursive

	export CC=clang
	export CXX=clang++
	export AR=llvm-ar
	export NM=llvm-nm
	export RANLIB=llvm-ranlib

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${_pkgname}"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target

	export CC=clang
	export CXX=clang++
	export AR=llvm-ar
	export NM=llvm-nm
	export RANLIB=llvm-ranlib
	export RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=lld"

	cargo build --frozen --release
}

package() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
	install -Dm 644 -t "${pkgdir}/usr/share/glib-2.0/schemas" "resources/moe.tsuna.tsukimi.gschema.xml"
	install -Dm 644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/tsukimi.desktop"
	install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/" "${srcdir}/tsukimi.svg"
	cp -r "target/i18n/locale" "${pkgdir}/usr/share/"
}
