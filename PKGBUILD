# Maintainer: may

pkgname=steel
pkgver=0.8.2
pkgrel=1
pkgdesc='An embedded scheme interpreter in Rust'
arch=('x86_64')
url='https://github.com/mattwparas/steel'
license=('Apache-2.0 OR MIT')
depends=('glibc')
optdepends=()
makedepends=('cargo' 'setconf')
conflicts=("${pkgname}")
provides=("${pkgname}=${pkgver}")
options=('!lto')
source=("https://github.com/mattwparas/${pkgname}/releases/download/v${pkgver}/steel-source.tar.gz")
sha256sums=('3ba6a00631cf0dd32ff117003b57ee131c7ed423a8cc19438ea6d2806c1375b3')

prepare() {
	cd 'source'

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd 'source'

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cargo build --frozen --release
	cargo build --package steel-forge --frozen --release
	cargo build --package steel-language-server --frozen --release
	cargo build --package cargo-steel-lib --frozen --release

	cd "${srcdir}"

	export STEEL_HOME=share
	"./source/target/release/${pkgname}" 'source/cogs/install.scm' 'source/cogs'

	setconf -a steel.sh 'export STEEL_SEARCH_PATHS=/usr/share/steel/cogs'
}

package() {
	cd 'source'

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "target/release/forge" "${pkgdir}/usr/bin/forge"
	install -Dm755 "target/release/steel-language-server" "${pkgdir}/usr/bin/steel-language-server"
	install -Dm755 "target/release/cargo-steel-lib" "${pkgdir}/usr/bin/cargo-steel-lib"

	install -Dm644 <("target/release/${pkgname}" "completions" "bash"  ) "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm644 <("target/release/${pkgname}" "completions" "zsh"   ) "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm644 <("target/release/${pkgname}" "completions" "fish"  ) "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm644 <("target/release/${pkgname}" "completions" "elvish") "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"

	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

	cd "${srcdir}"

	install -Dm644 "steel.sh" "${pkgdir}/etc/profile.d/steel.sh"

	for file in $(find share -type f -printf "%P\n"); do
		install -Dm644 "share/${file}" "${pkgdir}/usr/share/steel/${file}"
	done
}
