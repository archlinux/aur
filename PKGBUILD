# Maintainer: Ireozar <ireo@ireo.xyz>
pkgname="river-runetile-git"
_cmdname="runetile"
pkgver=r3.481df01
pkgrel=1
pkgdesc="Write your own river layout generator using rune"
arch=('x86_64')
url="https://codeberg.org/ireozar/river-runetile"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname"
    install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/runetile"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
