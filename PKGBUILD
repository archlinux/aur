# Maintainer: magnap <echo "bXJvazRhQGdtYWlsLmNvbQo=" | base64 -d>
pkgname=cyan-skillfish-governor-tt
pkgver=0.1.4.thermal_throttling
pkgrel=1
pkgdesc="GPU governor for the AMD Cyan Skillfish APU"
arch=('x86_64')
url="https://github.com/filippor/$pkgname"
license=('MIT')
depends=('libdrm')
makedepends=('cargo')
backup=("etc/$pkgname/config.toml")
source=("https://github.com/filippor/cyan-skillfish-governor/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('da1a4b7898830cf419fcc5e394599f8f13b4331b57813b06b670463846e6ec21e6de62bfded5ec0a6ec0b464662ee7bbf0bd46dc91c4cb15d27abb3207fd2d85')

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
