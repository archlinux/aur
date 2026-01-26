# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac
pkgver=0.9.2
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/${pkgname}"
license=("GPL-3.0-or-later")
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
options=(!debug !lto)
sha256sums=('c5160557a49a9a9b6645c85b17f60f5d1af8fa6664a3429e2ea860b024ec8015')

prepare() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features

	mkdir -p completions
	for shell in bash elvish fish powershell zsh nushell; do
        "./target/release/${pkgname}" completions --shell "$shell" > "completions/$shell"
    done
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"

	install -Dm644 "completions/bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm644 "completions/elvish" "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
	install -Dm644 "completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm644 "completions/powershell" "${pkgdir}/usr/share/powershell/Modules/${pkgname}/completions.ps1"
	install -Dm644 "completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
	install -Dm644 "completions/nushell" "${pkgdir}/usr/share/nushell/vendor/autoload/${pkgname}.nu"
}
