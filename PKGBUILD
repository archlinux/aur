# Maintainer: Eikano <lcuoin@gmail.com>
_pkgname="tsukimi"
pkgname="${_pkgname}-git"
pkgver=0.3.0.r88.g6805baf
pkgrel=1
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
	"tsukimi::git+https://github.com/tsukinaha/tsukimi.git"
)
sha256sums=('SKIP')

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
}
