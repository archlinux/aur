# Maintainer: magnap <echo "bXJvazRhQGdtYWlsLmNvbQo=" | base64 -d>
pkgname=cyan-skillfish-governor-tt
pkgver=0.1.5.thermal_throttling
pkgrel=1
pkgdesc="GPU governor for the AMD Cyan Skillfish APU"
arch=('x86_64')
url="https://github.com/filippor/$pkgname"
license=('MIT')
depends=('libdrm')
makedepends=('cargo')
backup=("etc/$pkgname/config.toml")
source=("https://github.com/filippor/cyan-skillfish-governor/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('84996c13f2ce34a932a2bd4351022bad1b30a1b33b6947642297491c15e395cc937e9941f90c5af6689478bccbbe85525ff504e5639daed7acd4551f27dc3c26')

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
