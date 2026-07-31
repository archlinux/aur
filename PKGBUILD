# Maintainer: gifnksm <makoto.nksm+aur@gmail.com>
pkgname=souko
pkgver=0.4.1
pkgrel=1
epoch=
pkgdesc="Provides an easy way to organize clones of remote git repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/gifnksm/souko"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs' 'libgit2' 'openssl')
conflicts=('souko-bin')
provides=('souko')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gifnksm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('52db1a572e239c9626f1113b18d9c08ba3e269c68fd65245eaff249e35e9d11e')
options=(!lto)

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release

	mkdir -p target/dist/man/
	SOUKO_GENERATE_MAN_TO=target/dist/man cargo run --release

	mkdir -p target/dist/completion/
	SOUKO_COMPLETE=bash cargo run --release > target/dist/completion/souko.bash
	SOUKO_COMPLETE=fish cargo run --release > target/dist/completion/souko.fish
	SOUKO_COMPLETE=zsh cargo run --release > target/dist/completion/_souko
	SOUKO_COMPLETE=nushell cargo run --release > target/dist/completion/souko-completions.nu
}

test() {
	cd "${pkgname}-${pkgver}"
	cargo test
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 target/release/souko -t "${pkgdir}/usr/bin/"

	install -Dm 644 target/dist/man/*.1 -t "${pkgdir}/usr/share/man/man1/"

	install -Dm 644 target/dist/completion/souko.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm 644 target/dist/completion/souko.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -Dm 644 target/dist/completion/_souko -t "${pkgdir}/usr/share/zsh/site-functions/"
	install -Dm 644 target/dist/completion/souko-completions.nu -t "${pkgdir}/usr/share/nushell/vendor/autoload/"

	install -Dm 644 souko.plugin.zsh -t "${pkgdir}/usr/share/zsh/plugins/souko/"
	install -Dm 644 shell/key-bindings.zsh -t "${pkgdir}/usr/share/zsh/plugins/souko/shell/"
	install -Dm 644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
