# Maintainer: magnap <echo "bXJvazRhQGdtYWlsLmNvbQo=" | base64 -d>
variant=-smu
pkgname=cyan-skillfish-governor$variant
pkgver=0.4.6
tag=v${pkgver}
pkgrel=1
pkgdesc="GPU governor for the AMD Cyan Skillfish APU"
arch=('x86_64')
url="https://github.com/filippor/cyan-skillfish-governor/tree/smu"
license=('MIT')
depends=('libdrm')
makedepends=('cargo')
backup=("etc/$pkgname/config.toml")
source=("https://github.com/filippor/cyan-skillfish-governor/archive/refs/tags/v0.4.6.tar.gz")
b2sums=('d278e9542c0928a21f2d540c97eb8654308b95c7e28d0902759b1579131bba70c38ad0e1af9e5471fc2750279a332d421f342477823a4d3b4bc2069bf0759c9d')

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
    install -Dm644 -t "$pkgdir/usr/share/dbus-1/system.d/" com.cyan.SkillFishGovernor.conf
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cyan-skillfish-governor${variant}/LICENSE"
    install -Dm644 default-config.toml "$pkgdir/etc/cyan-skillfish-governor${variant}/config.toml"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "cyan-skillfish-governor${variant}.service"
}
