# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Epistates
_gitname=gravityfile
_appname=${_gitname}
_execname=grav
pkgname=${_appname}
pkgdesc="File system explorer and analyzer with an interactive TUI"

pkgver=0.4.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_execname}")

makedepends=('cargo')
depends=('glibc' 'libgcc' 'xz')

options=('!strip' '!lto')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('340ea7dbe34ed2e560bffe3211507c9585b6dbcfa4175312625ba230a95e3c59')


prepare() {
	cd "${pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release

	mkdir -p "./completions"

	"./target/release/${_execname}" completions zsh > "./completions/${_appname}.zsh"
	"./target/release/${_execname}" completions bash > "./completions/${_appname}.bash"
	"./target/release/${_execname}" completions fish > "./completions/${_appname}.fish"
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "src/shell/${_execname}.zsh" "${pkgdir}/usr/share/${_appname}/${_execname}.zsh"
	install -Dm644 "src/shell/${_execname}.bash" "${pkgdir}/usr/share/${_appname}/${_execname}.bash"
	install -Dm644 "src/shell/${_execname}.fish" "${pkgdir}/usr/share/${_appname}/${_execname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
