# Maintainer: Elekrisk <einar.vilhelm.persson@gmail.com>
pkgname=spiral-git
pkgver=r12.d1db661
pkgrel=2
pkgdesc="A simple helix-inspired modal text editor; like helix, but worse"
arch=('x86_64')
url="https://github.com/Elekrisk/spiral.git"
license=('MIT')
groups=()
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo-nightly')
replaces=()
backup=()
options=(!lto)
install=
source=("${pkgname%-git}::git+https://github.com/Elekrisk/spiral.git")
noextract=()
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
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm0644 -t "${pkgdir}/etc/spiral/" "config.lua"
}
