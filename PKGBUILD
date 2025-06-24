# Maintainer: Joel Köper <foss@joelkoeper.de>

pkgname=hp-bios-fetcher
pkgver=0.1.1
pkgrel=1
pkgdesc='A simple tool for fetching HP BIOS updates'
url='https://gitlab.com/QuantumToaster/hp-bios-fetcher'
license=('0BSD')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.com/QuantumToaster/hp-bios-fetcher/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('db8d1d87e2b5243acf192e15193593fdb7ce6122d864369f31d811542b36b8f08b77222e3bde1b8cb23c240967810facc6f5b926b2a4b74b37c192fac2eae3d6')

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

