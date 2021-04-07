# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=git-warp-time-git
pkgver=0.2.0.r10.gf80c61e
pkgrel=1
pkgdesc='reset file timestamps to repo state'
arch=(x86_64)
url="https://github.com/alerque/${pkgname%-git}"
license=(GPL3)
makedepends=(rust)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags --match="v*" |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
    cargo fetch --locked
}

build() {
	cd "$pkgname"
	cargo build --release --locked --all-features
}

check() {
	cd "$pkgname"
	cargo test
}

package() {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
