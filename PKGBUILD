# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=sifter
pkgname="$_pkgbase-git"
pkgver=0.1.0.r1.g03565fd
pkgrel=1
pkgdesc='Catalog photos, videos and audio into a date-structured library by capture date'
arch=('x86_64' 'aarch64')
url='https://github.com/SelfRef/sifter'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=('!lto')
source=("$_pkgbase::git+https://github.com/SelfRef/sifter.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$_pkgbase"
	install -Dm0755 "target/release/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
