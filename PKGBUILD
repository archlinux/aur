# Maintainer: Joel Köper <foss@joelkoeper.de>

pkgname=hp-bios-fetcher
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple tool for fetching HP BIOS updates'
url='https://gitlab.com/QuantumToaster/hp-bios-fetcher'
license=('0BSD')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.com/QuantumToaster/hp-bios-fetcher/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('242603c3a06dfaf5d3cb7f40c269aeff33782a47699e40fc401d1f65e8c9bbe85761979d84813cf57352aa3fb2b62f8f58dc4a4e20ff75d7e4c4a5cd2a1c3a08')

prepare() {
	cd $pkgname-v$pkgver

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname-v$pkgver

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	cd $pkgname-v$pkgver

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/share/zsh/site-functions"
	install -Dm755 "target/_$pkgname" "$pkgdir/usr/share/zsh/site-functions"

	mkdir -p "$pkgdir/usr/share/bash-completion/completions"
	install -Dm755 "target/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions"

	mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
	install -Dm755 "target/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d"

	mkdir -p "$pkgdir/usr/share/elvish/lib"
	install -Dm755 "target/$pkgname.elv" "$pkgdir/usr/share/elvish/lib"
}

