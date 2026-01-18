# Maintainer: magnap <echo "bXJvazRhQGdtYWlsLmNvbQo=" | base64 -d>
pkgname=cyan-skillfish-governor-tt
pkgver=0.1.6
pkgrel=1
pkgdesc="GPU governor for the AMD Cyan Skillfish APU"
arch=('x86_64')
url="https://github.com/filippor/cyan-skillfish-governor/tree/tt"
license=('MIT')
depends=('libdrm')
makedepends=('cargo')
backup=("etc/$pkgname/config.toml")
source=("https://github.com/filippor/cyan-skillfish-governor/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('af9af1f7c873c51ffd84bfbf73ef0aa23e8e41c3cec80ccf2d904567e26bdb4756bd113dc150645f6a3b264661e4e7675ffd98806f32d1483bbf572db02956cb')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "cyan-skillfish-governor-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "cyan-skillfish-governor-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "cyan-skillfish-governor-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/cyan-skillfish-governor"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cyan-skillfish-governor/LICENSE"
    install -Dm644 default-config.toml "$pkgdir/etc/cyan-skillfish-governor/config.toml"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "cyan-skillfish-governor.service"
}
