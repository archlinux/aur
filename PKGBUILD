# Maintainer: FineFindus <Finefindusgh@gmail.com>
pkgname=artem
pkgver=2.0.6
pkgrel=1
pkgdesc='Convert images from multiple formats (jpg, png, webp, etc…) to ASCII art, written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/finefindus/artem'
license=('MPL2')
makedepends=('cargo')
provides=('artem')
conflicts=('artem')
source=("$pkgname-$pkgver=.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('670a15d55af396706f3eeba9342da4070c2ac2983623e97eb44505349b62f60e')


prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen

	#create a completions and doc folder
	mkdir -p deployment/completions
	mkdir -p deployment/doc
	#copy completion files and man page
	cp -u target/release/build/artem-*/out/* deployment/completions/
	#move man page to doc folder
	mv deployment/completions/artem.1 deployment/doc/
	#copy binary file
	cp -u target/release/artem deployment
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen --test '*'
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/artem -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 deployment/doc/artem.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm 644 deployment/completions/artem.bash -t "$pkgdir/usr/share/bash-completion/completions/"
	install -Dm 644 deployment/completions/artem.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm 644 deployment/completions/_artem -t "$pkgdir/usr/share/zsh/site-functions"
}

