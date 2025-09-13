# Maintainer: Ireozar <ireo@ireo.xyz>
pkgname="openspeedrun-git"
_cmdname="openspeedrun"
pkgver=r108.519ceeb
pkgrel=1
pkgdesc="Modern and minimalistic open-source speedrun timer"
arch=('x86_64')
url="https://github.com/SrWither/OpenSpeedRun"
license=('BSD-3')
depends=('glibc' 'gcc-libs' 'wayland' 'mesa' 'libx11' 'oniguruma')
makedepends=('git' 'cargo' 'clang')
conflicts=('openspeedrun')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
options=(!lto)

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
    install -Dm755 "target/release/openspeedrun" "$pkgdir/usr/bin/openspeedrun"
    install -Dm755 "target/release/openspeedrun-cli" "$pkgdir/usr/bin/openspeedrun-cli"
    install -Dm755 "target/release/openspeedrun-cfg" "$pkgdir/usr/bin/openspeedrun-cfg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
