# Maintainer: sty <pbk at tuta dot io>
pkgname=cargo-run-script-git
pkgver=r11.96df282
pkgrel=1
pkgdesc="A Cargo subcommand which allows you to define scripts for common project related tasks within your 'Cargo.toml'."
arch=(x86_64)
url=https://github.com/JoshMcguigan/cargo-run-script
license=(Apache-2.0 MIT)
depends=(gcc-libs glibc cargo)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/JoshMcguigan/cargo-run-script")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

check() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
	cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable 
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm644 LICENSE-MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
