# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyprsome-git
_pkgname=${pkgname%-git}
pkgver=r17.e3dfeb9
pkgrel=1
pkgdesc=''
arch=(x86_64)
url="https://github.com/sopa0/$_pkgname"
license=(GPL3)
depends=(hyprland)
makedepends=(cargo
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $_pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
