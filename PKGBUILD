# Maintainer: may

pkgname=steel-bin
_pkgname=steel
pkgver=0.8.2
pkgrel=3
pkgdesc='An embedded scheme interpreter in Rust'
arch=('x86_64')
url='https://github.com/mattwparas/steel'
license=('Apache-2.0 OR MIT')
depends=('glibc')
optdepends=()
makedepends=()
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
_source="https://github.com/mattwparas/${_pkgname}"
_download="${_source}/releases/download"
source=("${_download}/v${pkgver}/steel-interpreter-x86_64-unknown-linux-gnu.tar.xz"
		"${_download}/v${pkgver}/steel-forge-x86_64-unknown-linux-gnu.tar.xz"
		"${_download}/v${pkgver}/steel-language-server-x86_64-unknown-linux-gnu.tar.xz"
		"${_download}/v${pkgver}/cargo-steel-lib-x86_64-unknown-linux-gnu.tar.xz"
		"${_download}/v${pkgver}/steel-source.tar.gz"
		"https://raw.githubusercontent.com/mattwparas/${_pkgname}/refs/tags/v${pkgver}/LICENSE-APACHE"
		"https://raw.githubusercontent.com/mattwparas/${_pkgname}/refs/tags/v${pkgver}/LICENSE-MIT"
		'steel.sh')
sha256sums=('d0334d14168df4b88bb16bd4dbdfe03ab4bac147122f1be0c2ec5f083bf726fe'
			'11bafc23cf8a93655fbfc9a06d7cf0015173ad8b40abd999b26d496e27cadd70'
			'd6cbc621cb76d132f91236acbba41868a0d84e95aaa412c0bd07e7ca0460810a'
			'44ca1d46e6978852db5e72b8082b198cc3e3a2c1fe5f09928d1d2d0542a9c24f'
			'3ba6a00631cf0dd32ff117003b57ee131c7ed423a8cc19438ea6d2806c1375b3'
			'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
			'259767bca3402a6a2d576f97f7034adf26337f51920aa8887380ae4f552f33f2'
			'a2fc879b0791ef9f3b24274aa8ec84f4877d6c220d1205c6e44691d80be63c36')

build() {
	export STEEL_HOME=share
	"./steel-interpreter-x86_64-unknown-linux-gnu/${_pkgname}" 'source/cogs/install.scm' 'source/cogs'
}

package() {
	install -Dm755 "steel-interpreter-x86_64-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 'steel-forge-x86_64-unknown-linux-gnu/forge' "${pkgdir}/usr/bin/forge"
	install -Dm755 'steel-language-server-x86_64-unknown-linux-gnu/steel-language-server' "${pkgdir}/usr/bin/steel-language-server"
	install -Dm755 'cargo-steel-lib-x86_64-unknown-linux-gnu/cargo-steel-lib' "${pkgdir}/usr/bin/cargo-steel-lib"

	install -Dm644 <("${pkgdir}/usr/bin/${_pkgname}" "completions" "bash"  ) "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 <("${pkgdir}/usr/bin/${_pkgname}" "completions" "zsh"   ) "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 <("${pkgdir}/usr/bin/${_pkgname}" "completions" "fish"  ) "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm644 <("${pkgdir}/usr/bin/${_pkgname}" "completions" "elvish") "${pkgdir}/usr/share/elvish/lib/${_pkgname}.elv"

    install -Dm644 'LICENSE-APACHE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 'LICENSE-MIT' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

	install -Dm644 'steel.sh' "${pkgdir}/etc/profile.d/steel.sh"

	for file in $(find share -type f -printf "%P\n"); do
		install -Dm644 "share/${file}" "${pkgdir}/usr/share/steel/${file}"
	done
}
