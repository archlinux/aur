pkgname=tab-rs-git
_pkgname=tab-rs
pkgver=0.5.0.178.g01c1852
epoch=1
pkgrel=1
pkgdesc="The intuitive config-driven terminal multiplexer"
arch=('x86_64' 'i686')
url="https://github.com/austinjones/tab-rs"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
optdepends=()
provides=('tab-rs')
conflicts=('tab' 'tab-rs')
source=($pkgname::git+https://github.com/austinjones/tab-rs)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname/tab
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	cargo build --release --locked --target-dir=target
}

package() {
	cd $pkgname

	install -D -m755 "$srcdir/$pkgname/target/release/tab" "$pkgdir/usr/bin/tab"
	install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	install -Dm644 tab/src/completions/bash/tab.bash "$pkgdir/usr/share/bash-completion/completions/tab"
	install -Dm644 tab/src/completions/zsh/_tab "$pkgdir/usr/share/zsh/site-functions/_tab"
	install -Dm644 tab/src/completions/fish/tab.fish "$pkgdir/usr/share/fish/vendor_completions.d/tab.fish"
}
