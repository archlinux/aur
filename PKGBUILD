# Maintainer: Price Clark <gpwclark at gmail dot com>

# NOTE
# when updating version: makepkg --printsrcinfo > .SRCINFO

# TODO
# cross compile: https://github.com/japaric/rust-cross

pkgname=sl-sh-git
pkgver=0.8.56
pkgrel=1
epoch=
pkgdesc='simple lisp based shell'
arch=("x86_64")
url='https://github.com/sstanfield/slsh'
license=('MIT')
groups=()
depends=()
makedepends=('rustup'
'git')
checkdepends=()
optdepends=()
provides=("sl-sh-git")
conflicts=("sl-sh-git"
"sl-sh")
replaces=()
backup=()
options=()
install=
changelog=
source=('sl-sh::git+https://github.com/sstanfield/slsh#branch=master')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	mv "${pkgname%-git}" "${pkgname%-git}-$pkgver"
}

build() {
	cd "${pkgname%-git}-$pkgver"
	rustup target add x86_64-unknown-linux-musl
	cargo build --release --target x86_64-unknown-linux-musl --locked --all-features
}

check() {
	cd "${pkgname%-git}-$pkgver"
	cargo check
	#cargo test --release --locked
}

package() {
	cd "${pkgname%-git}-$pkgver"
	install -D -m 755 "${srcdir}/${pkgname%-git}-$pkgver/target/x86_64-unknown-linux-musl/release/sl-sh" -t "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
	cp ${srcdir}/${pkgname%-git}-$pkgver/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

pkgver() {
	cd "${pkgname%-git}-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
