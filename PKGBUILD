# Maintainer: Joel Köper <foss@joelkoeper.de>

pkgname=hp-bios-fetcher
pkgver=0.2.2
pkgrel=1
pkgdesc='A simple tool for fetching HP BIOS updates'
url='https://gitlab.com/QuantumToaster/hp-bios-fetcher'
license=('0BSD')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.com/QuantumToaster/hp-bios-fetcher/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('906ed36c2127d9597448c7e73b69aeb251fdaae3374246b94f3ebab452da46dd54925ddd7f4013245ca620023af6e63cafe0b7b23a9918c57c59fb07e30c1c05')

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

