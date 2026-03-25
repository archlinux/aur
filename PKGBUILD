# Maintainer: magnap <echo "bXJvazRhQGdtYWlsLmNvbQo=" | base64 -d>
variant=-smu
pkgname=cyan-skillfish-governor$variant
pkgver=0.3.2
tag=v${pkgver}
pkgrel=1
pkgdesc="GPU governor for the AMD Cyan Skillfish APU"
arch=('x86_64')
url="https://github.com/filippor/cyan-skillfish-governor/tree/smu"
license=('MIT')
depends=('libdrm')
makedepends=('cargo')
backup=("etc/$pkgname/config.toml")
source=("https://github.com/filippor/cyan-skillfish-governor/archive/refs/tags/${tag}.tar.gz")
b2sums=('8d1b977a9dd69a3fc1d5ba8679b9714c57a2c2ac0045b5d816fa364594e627c33e7fa4ff1260715f1962346a254be13de6a901234fbe9d305110803858ed5991')

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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/cyan-skillfish-governor${variant}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cyan-skillfish-governor${variant}/LICENSE"
    install -Dm644 default-config.toml "$pkgdir/etc/cyan-skillfish-governor${variant}/config.toml"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "cyan-skillfish-governor${variant}.service"
}
