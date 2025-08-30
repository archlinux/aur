# Maintainer: NJ <njnjdeez at gmail dot com>

pkgname=batwatch-git
pkgver=r8.bdd16d9
pkgrel=1
pkgdesc="Blink the screen when battery level reaches certain limits"
arch=('x86_64')
url="https://github.com/nj-twice/batwatch"
license=(Unlicense)
makedepends=('git' 'cargo')
source=("git+${url}")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}


package() {
	cd "${srcdir}/${pkgname%-git}"
	install -Dm755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin/"
	install -Dm644 "systemd/${pkgname%-git}.service" -t "${pkgdir}/usr/lib/systemd/user/"
}
