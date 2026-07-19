# Maintainer: Mark <mark@betalupi.com>
pkgname=beans
pkgver=0.0.4
pkgrel=1
pkgdesc="CLI accounting"
arch=('x86_64' 'aarch64')
url="https://git.betalupi.com/Mark/beans"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname}"
	export CARGO_HOME="${srcdir}/.cargo"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${pkgname}"
	export CARGO_HOME="${srcdir}/.cargo"
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	cargo build --frozen --release --locked --bin "${pkgname}"
}

check() {
	cd "${pkgname}"
	export CARGO_HOME="${srcdir}/.cargo"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release --locked
}

package() {
	cd "${pkgname}"
	install -Dm0755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
