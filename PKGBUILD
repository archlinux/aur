# Maintainer: guitaripod <marcus@midgarcorp.cc>
pkgname=prebake
pkgver=0.1.0
pkgrel=1
pkgdesc="Bakes Steam's Vulkan shader caches while you are away, so games start without shader processing"
arch=('x86_64')
url='https://github.com/guitaripod/prebake'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'vulkan-icd-loader')
optdepends=('steam: the games prebake bakes shaders for'
            'gamemode: pause for games registered with Feral GameMode too')
makedepends=('cargo')
install=prebake.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/guitaripod/prebake/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bef4f7d3d804678e06f638fa9db6a339ede6668ce89de4b21a4d761923cac544')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/prebake" "$pkgdir/usr/bin/prebake"
    install -Dm644 "packaging/prebake.service" "$pkgdir/usr/lib/systemd/user/prebake.service"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/prebake/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/prebake/README.md"
}
