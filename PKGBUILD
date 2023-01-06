# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=himalaya-git
_pkgname=himalaya
pkgver=r388.bda37ca
pkgrel=1
pkgdesc="Minimalist CLI email client, written in Rust."
arch=('x86_64')
url="https://github.com/soywod/himalaya"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
optdepends=('notmuch-runtime: notmuch backend through cargo features')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	RUSTUP_TOOLCHAIN=stable cargo build --release --frozen --features default --target-dir=target
}

check() {
   cd "$_pkgname"
   RUSTUP_TOOLCHAIN=stable cargo test --frozen --features default
}

package() {
   cd "$_pkgname"
   install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
   install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${_pkgname}"
   install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${_pkgname}"
}
