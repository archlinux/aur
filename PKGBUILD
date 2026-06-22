# Maintainer: magnap <echo "bXJvazRhQGdtYWlsLmNvbQo=" | base64 -d>
variant=-smu
pkgname=cyan-skillfish-governor$variant
pkgver=0.4.11
tag=v${pkgver}
pkgrel=1
pkgdesc="GPU governor for the AMD Cyan Skillfish APU"
arch=('x86_64')
url="https://github.com/filippor/cyan-skillfish-governor/tree/smu"
license=('MIT')
depends=('libdrm')
makedepends=('cargo')
backup=("etc/$pkgname/config.toml")
source=("https://github.com/filippor/cyan-skillfish-governor/archive/refs/tags/v0.4.11.tar.gz")
b2sums=('f1504ec681c383defb56f8fa62f2bd3a85c09b1bae5ccf670c08007a2698f308972d902bfed882ca3eb511df29d8a65e2211f0b9a657f174028916d5889af8d5')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "cyan-skillfish-governor-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CYAN_SKILLFISH_GOVERNOR_VERSION="${pkgver}"
    cd "cyan-skillfish-governor-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "cyan-skillfish-governor-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/cyan-skillfish-governor${variant}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "scripts/cyan-skillfish-performance-mode"
    install -Dm644 -t "$pkgdir/usr/share/dbus-1/system.d/" com.cyanskillfish.Governor.conf
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cyan-skillfish-governor${variant}/LICENSE"
    install -Dm644 default-config.toml "$pkgdir/etc/cyan-skillfish-governor${variant}/config.toml"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "cyan-skillfish-governor${variant}.service"
}
