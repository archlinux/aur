# Maintainer: Your Name <jan dot claussen10 at web dot de>
_pkgname=ginko
pkgname=ginko-git
pkgver=v0.0.5.r6.g4437e3a
pkgrel=1
pkgdesc="A device-tree source parser, analyzer and language server"
arch=('any')
url="https://github.com/Schottkyc137/ginko"
license=('MIT')
makedepends=(cargo)
provides=('ginko' 'ginko-ls')
conflicts=('ginko' 'ginko-bin' 'ginko_ls' 'ginko_ls-bin')
replaces=('ginko' 'ginko-bin' 'ginko_ls' 'ginko_ls-bin')
source=("git+https://github.com/Schottkyc137/ginko.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "${srcdir}/${_pkgname}"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "${srcdir}/${_pkgname}"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "${srcdir}/${_pkgname}"
	cargo test --frozen --all-features
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}_ls"
	install -D -m644 \
		"${srcdir}/${_pkgname}/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
