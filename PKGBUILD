# Maintainer: may

pkgname=steel-git
_pkgname=steel
pkgver=0.8.2
pkgrel=1
pkgdesc='An embedded scheme interpreter in Rust'
arch=('x86_64')
url='https://github.com/mattwparas/steel'
license=('Apache-2.0 OR MIT')
depends=('glibc')
optdepends=()
makedepends=('git' 'cargo' 'setconf')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!lto')
source=("git+https://github.com/mattwparas/steel.git")
sha256sums=(SKIP)

pkgver() {
	cd "${_pkgname}"
	git describe --long --abbrev=7 --match 'v*' | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "${_pkgname}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cargo build --frozen --release
	cargo build --package steel-forge --frozen --release
	cargo build --package steel-language-server --frozen --release
	cargo build --package cargo-steel-lib --frozen --release

	cd "${srcdir}"

	export STEEL_HOME=share
	"./${_pkgname}/target/release/${_pkgname}" "${_pkgname}/cogs/install.scm" "${_pkgname}/cogs"

	setconf -a steel.sh 'export STEEL_SEARCH_PATHS=/usr/share/steel/cogs'
}

package() {
	cd "${_pkgname}"

	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "target/release/forge" "${pkgdir}/usr/bin/forge"
	install -Dm755 "target/release/steel-language-server" "${pkgdir}/usr/bin/steel-language-server"
	install -Dm755 "target/release/cargo-steel-lib" "${pkgdir}/usr/bin/cargo-steel-lib"

	install -Dm644 <("target/usr/bin/${_pkgname}" "completions" "bash"  ) "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 <("target/usr/bin/${_pkgname}" "completions" "zsh"   ) "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 <("target/usr/bin/${_pkgname}" "completions" "fish"  ) "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm644 <("target/usr/bin/${_pkgname}" "completions" "elvish") "${pkgdir}/usr/share/elvish/lib/${_pkgname}.elv"

	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"

	cd "${srcdir}"

	install -Dm644 "steel.sh" "${pkgdir}/etc/profile.d/steel.sh"

	for file in $(find share -type f -printf "%P\n"); do
		install -Dm644 "share/${file}" "${pkgdir}/usr/share/steel/${file}"
	done
}
