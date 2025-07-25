# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgname=bestool
pkgname=${_pkgname}-git
pkgver=r93.d6607c0
pkgrel=2
pkgdesc="BES2300 programming tool (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Ralim/${_pkgname}"
license=('MIT')
makedepends=('cargo')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}/${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/${_pkgname}/${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${srcdir}/${_pkgname}/${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${srcdir}/${_pkgname}/${_pkgname}"

	install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
}
