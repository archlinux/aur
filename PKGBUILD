# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=dmitui-git
pkgver=r17.88b1e3a
pkgrel=1
pkgdesc="TUI version of dmidecode tool"
arch=('x86_64')
url="https://github.com/pythops/dmitui"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 target/release/${pkgname::-4} "$pkgdir/usr/bin/${pkgname::-4}"
}
