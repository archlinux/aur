# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=msavox
_gitname=cleecode
_appname=${_gitname%code}
pkgname=${_gitname}
pkgdesc="A terminal IDE written in Rust"

pkgver=0.26.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')
optdepends=('poppler' 'pandoc-cli' 'typst' 'chafa')

options=('!strip' '!lto')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('72b6e253e421edfed3d98e2f817b6d3c41fc82a1a36003c05c6e54f2f64a4d5c')


prepare() {
	cd "${pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release -- \
		--skip "terminal_panel::tests::a_shell_that_ignores_the_hangup_cannot_hold_the_pane_open" \
		--skip "terminal_panel::tests::a_program_that_asked_for_the_mouse_gets_the_buttons" \
		--skip "terminal_panel::tests::a_program_that_asked_for_the_mouse_gets_the_wheel" \
		--skip "terminal_panel::tests::a_startup_command_is_typed_onto_a_line_of_its_own"
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 target/release/${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 docs/${_appname}.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 assets/fonts/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
