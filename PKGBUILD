# Maintainer: Ireozar <ireo@ireo.xyz>
pkgname="mailnaggertray-git"
pkgver=r11.e498fb4
pkgrel=1
pkgdesc="Tray icon for use with mailnagger"
arch=('x86_64')
url="https://codeberg.org/ireozar/mailnaggertray"
license=('MIT')
depends=('glibc' 'mailnagger' 'gcc-libs')
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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
