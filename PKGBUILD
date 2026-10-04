# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=octomind
pkgver=0.36.0
pkgrel=2
pkgdesc="Session-based AI development assistant with conversational codebase interaction and multi-provider AI integration"
arch=('x86_64')
url="https://github.com/muvon/octomind"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
_tag="0.36.0"
_srcdir="octomind-0.36.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/muvon/octomind/tar.gz/refs/tags/$_tag")
sha256sums=('cb4ddc470d2534c271db2a4165214353070070f371fefce7e84dd3b6be0aeab2')

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 "target/release/octomind" "$pkgdir/usr/bin/octomind"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
	install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
	install -d "$pkgdir/usr/share/doc/$pkgname/doc"
	cp -r doc/. "$pkgdir/usr/share/doc/$pkgname/doc/"
	install -d "$pkgdir/usr/share/$pkgname/config-templates"
	cp -r config-templates/. "$pkgdir/usr/share/$pkgname/config-templates/"
	install -Dm644 <("$pkgdir/usr/bin/octomind" complete bash) "$pkgdir/usr/share/bash-completion/completions/octomind"
	install -Dm644 <("$pkgdir/usr/bin/octomind" complete zsh) "$pkgdir/usr/share/zsh/site-functions/_octomind"
	install -Dm644 <("$pkgdir/usr/bin/octomind" complete fish) "$pkgdir/usr/share/fish/vendor_completions.d/octomind.fish"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
	if [ -f README.md ]; then
		install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	fi
}
