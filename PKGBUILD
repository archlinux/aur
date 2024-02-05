# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
pkgname=ord-git
pkgver=0.15.0.r31.416b2867
pkgrel=1
pkgdesc="An index, block explorer, and command-line wallet for Ordinals"
arch=('x86_64' 'aarch64')
url="https://github.com/ordinals/ord"
license=('CC0-1.0')
groups=()
depends=()
makedepends=('git' 'cargo' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	'git+https://github.com/ordinals/ord#branch=master'
	'ord.service'
)
noextract=()
sha256sums=('SKIP'
            '7e4ffc816841ee276c0af3edf77e26c54fa78f9e38dc5872bf29fc27ebdfb9cb')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	just ci
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "../ord.service"
}
