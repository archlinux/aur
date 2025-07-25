# Maintainer: coder0x6675

pkgname=nih-plug-git
pkgver=r2245.ecfd6322
pkgrel=3
pkgdesc="Rust VST3 and CLAP plugin collection by Robbert Van Der Helm"
arch=('x86_64')
url="https://github.com/robbert-vdh/nih-plug"
license=('GPL-3.0-only')
groups=('pro-audio')
#depends=('libglvnd' 'xcb-util-wm' 'libxcursor' 'alsa-lib' 'jack2')
depends=('glibc' 'gcc-libs' 'libglvnd' 'xcb-util-wm' 'libx11')
makedepends=('git' 'python' 'cargo-nightly' 'libxcursor' 'alsa-lib' 'jack')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	plugins=( $(ls ./plugins) )
	plugins=( ${plugins[@]/examples} )
	for plugin in "${plugins[@]}"; do
		cargo xtask bundle "$plugin" --frozen --release --all-features
	done
}

check() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=nightly
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/lib/clap" "$pkgdir/usr/lib/vst3"
	install -m 0755 ./target/bundled/*.clap "$pkgdir/usr/lib/clap"
	cp -r ./target/bundled/*.vst3 "$pkgdir/usr/lib/vst3"
}

