# Maintainer: ARKye03 <rafa03-dev@proton.me>

pkgname=lumen-git
_pkgname=lumen
pkgver=r172.960054b # Can't be empty, will be set dynamically
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
    cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
