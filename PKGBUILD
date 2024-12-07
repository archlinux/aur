# Maintainer: ARKye03 <rafa03-dev@proton.me>

pkgname=lumen-git
_pkgname=lumen
pkgver=v1.6.0.r16.g3cccf79 # Can't be empty, will be set dynamically
pkgrel=1
pkgdesc="Instant AI Git Commit message, Git changes summary from the CLI (no API key required)"
url="https://github.com/jnsahaj/lumen"
license=('MIT')
arch=('x86_64')
source=("git+$url")
makedepends=('cargo')
depends=('git')
optdepends=(
	'fzf: Required for lumen list command'
	'mdcat: Required for pretty output formatting'
)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname" || exit
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname" || exit
	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
	cd "$srcdir/$_pkgname" || exit
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/$_pkgname" || exit
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/$_pkgname" || exit
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
