# Maintainer: Eikano <lcuoin@gmail.com>

_pkgname="tsukimi"
pkgname="${_pkgname}-git"
pkgver=0.3.0.r88.g6805baf
pkgrel=2
pkgdesc='A simple third-party Emby client'
arch=('x86_64')
url="https://github.com/tsukinaha/tsukimi"
license=('GPL-3.0-or-later')
provides=('tsukimi' 'tsukimi-git')
conflicts=('tsukimi')
depends=('mpv'
	'ffmpeg'
	'gtk4')
makedepends=(
	'git'
	'cargo')
source=(
	tsukimi::git+https://github.com/tsukinaha/tsukimi.git
	tsukimi.desktop
	tsukimi.png
)
sha256sums=('SKIP'
	'c4ddf8dbf68f04ecefd4280b48ef4084ae7d4d9ce1072f97e30832a565d13bf6'
	'04a712d60bbf5cc8873af24fb8ff76b47f27ef77ba45c7901fb7d3cd26dd6893')

pkgver() {
	cd "${_pkgname}"
	echo $(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
	install -Dm 644 -t "${pkgdir}"/usr/share/applications/ "${srcdir}"/tsukimi.desktop
	install -Dm 644 -t "${pkgdir}"/usr/share/pixmaps/ "${srcdir}"/tsukimi.png
}
