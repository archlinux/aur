# Maintainer: Mark <mark@betalupi.com>
pkgname=beans-git
_pkgname=beans
pkgver=r0.0.4
pkgrel=1
pkgdesc="CLI accounting"
arch=('x86_64' 'aarch64')
url="https://git.betalupi.com/Mark/beans"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf 'r%s.%s' \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=8 HEAD)"
}

prepare() {
	cd "${_pkgname}"
	export CARGO_HOME="${srcdir}/.cargo"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${_pkgname}"
	export CARGO_HOME="${srcdir}/.cargo"
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	cargo build --frozen --release --bin "${_pkgname}"
}

check() {
	cd "${_pkgname}"
	export CARGO_HOME="${srcdir}/.cargo"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release
}

package() {
	cd "${_pkgname}"
	install -Dm0755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
