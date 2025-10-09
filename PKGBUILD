# Maintainer: Alteriks <aur@kil.ovh>

pkgname="nirius"
pkgver=0.5.4
pkgrel=1
pkgdesc="Utility commands for the niri compositor"
arch=("i686" "x86_64")
url="https://sr.ht/~tsdh/nirius"
license=("GPLv3")
depends=("niri")
makedepends=("rust" "cargo" "git")
provides=("niriusd")
conflicts=("nirius-git")
source=("$pkgname::git+https://git.sr.ht/~tsdh/nirius#tag=${pkgname}-${pkgver}")
sha256sums=("SKIP")

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export SHELL_COMPLETIONS_DIR="$PWD/completions"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm755 target/release/${pkgname}d "$pkgdir/usr/bin/${pkgname}d"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
