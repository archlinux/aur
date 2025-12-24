# Maintainer: jakeb-grant
pkgname=hyprpier-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Hyprland monitor profile manager with Thunderbolt dock detection"
arch=('x86_64')
url="https://github.com/jakeb-grant/hyprpier"
license=('MIT')
depends=('hyprland')
makedepends=('cargo' 'git')
provides=('hyprpier')
conflicts=('hyprpier')
source=("git+https://github.com/jakeb-grant/hyprpier.git")
sha256sums=('SKIP')

pkgver() {
    cd hyprpier
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd hyprpier
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd hyprpier
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd hyprpier
    install -Dm755 "target/release/hyprpier" "$pkgdir/usr/bin/hyprpier"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
