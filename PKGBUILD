# Maintainer: Ilyas Turki <turki.ilyass@gmail.com>
pkgname=prayer-times
pkgver=0.3.1
pkgrel=1
makedepends=('rust')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Islamic Prayer Times Informations and Notifications"
url="https://github.com/Yasso9/prayer-times"
license=('MIT')
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yasso9/prayer-times/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd $pkgname-$pkgver
    export CARGO_HOME=$srcdir/.cargo                 # Download all to src directory, not in ~/.cargo
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS="--remap-path-prefix=$srcdir=/" # Prevent warning: 'Package contains reference to $srcdir'
    export CARGO_HOME=$srcdir/.cargo                 # Use downloaded earlier from src directory, not from ~/.cargo
    export CARGO_TARGET_DIR=target                   # Place the output in target relative to the current directory
	cargo build --release --frozen --locked
	# cargo run -- generate-shell
	./target/release/$pkgname generate-shell
}

check() {
	cd "$pkgname-$pkgver"
	cargo check
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

	# Shell completions
	install -Dm644 "target/completions/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 "target/completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "target/completions/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "assets/mosque-svgrepo-com.png" "$pkgdir/usr/share/icons/mosque-svgrepo-com.png"
}
