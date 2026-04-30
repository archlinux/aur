# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
pkgname=cargo-sync-rdme
pkgver=0.5.0
pkgrel=1
epoch=
pkgdesc="Cargo subcommand to synchronize README with crate documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/cargo-sync-rdme"
license=('MIT' 'Apache-2.0')
depends=('libgit2' 'cargo')
conflicts=('cargo-sync-rdme-bin')
provides=('cargo-sync-rdme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gifnksm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dde61edcf102f288372085ba9cf8cfaa07dfa3cc2ee308364fa4659201d360a1')
options=(!lto)

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release

	mkdir -p target/dist/man
	CARGO_SYNC_RDME_GENERATE_MAN_TO=target/dist/man cargo run --release

	mkdir -p target/dist/completion
	CARGO_SYNC_RDME_COMPLETE=bash cargo run --release > target/dist/completion/cargo-sync-rdme.bash
	CARGO_SYNC_RDME_COMPLETE=fish cargo run --release > target/dist/completion/cargo-sync-rdme.fish
	CARGO_SYNC_RDME_COMPLETE=zsh cargo run --release > target/dist/completion/_cargo-sync-rdme
	CARGO_SYNC_RDME_COMPLETE=nushell cargo run --release > target/dist/completion/cargo-sync-rdme-completions.nu
}

test() {
	cd "${pkgname}-${pkgver}"
	cargo test
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm 755 target/release/cargo-sync-rdme -t "${pkgdir}/usr/bin/"

	install -Dm 644 target/dist/man/cargo-sync-rdme.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm 644 target/dist/completion/_cargo-sync-rdme -t "${pkgdir}/usr/share/zsh/site-functions/"
	install -Dm 644 target/dist/completion/cargo-sync-rdme.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm 644 target/dist/completion/cargo-sync-rdme.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

	install -Dm 644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
