# Maintainer: Fermín Olaiz <fermin@olaiz.net>

_pkgname=AutoKuma
pkgname="${_pkgname,,}-cli"
_pkgver=2.1.0-rc.2
pkgver="${_pkgver/-/_}"
pkgrel=2
pkgdesc="kuma-cli tool from the AutoKuma project"
arch=('x86_64' 'aarch64')
url='https://github.com/BigBoot/AutoKuma'
license=('MIT')
depends=('glibc' 'openssl' 'libgcc' 'libstdc++')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BigBoot/$_pkgname/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('d33c3115eae4969f322a77ec0688b07dddd4e2f08714b0a12bcc054fad07fea0')

# It fails with lto, see https://bbs.archlinux.org/viewtopic.php?id=312228
options=(!lto)

prepare() {
	cd "$_pkgname-$_pkgver/kuma-cli"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname-$_pkgver/kuma-cli"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname-$_pkgver/kuma-cli"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
	cd "$_pkgname-$_pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" 'kuma-cli/target/release/kuma'
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" 'LICENSE'
}
