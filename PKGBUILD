# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=tbsp-git
pkgver=r10.1702f95
pkgrel=1
epoch=
pkgdesc='tree-based source-processing language'
arch=('x86_64')
url="https://git.peppe.rs/languages/tbsp"
#license=()
groups=()
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}

