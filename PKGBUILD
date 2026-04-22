# Maintainer: magnap <echo "bXJvazRhQGdtYWlsLmNvbQo=" | base64 -d>
variant=-smu
pkgname=cyan-skillfish-governor$variant
pkgver=0.4.4
tag=v${pkgver}
pkgrel=1
pkgdesc="GPU governor for the AMD Cyan Skillfish APU"
arch=('x86_64')
url="https://github.com/filippor/cyan-skillfish-governor/tree/smu"
license=('MIT')
depends=('libdrm')
makedepends=('cargo')
backup=("etc/$pkgname/config.toml")
source=("https://github.com/filippor/cyan-skillfish-governor/archive/refs/tags/v0.4.4.tar.gz")
b2sums=('51eadd07bcb535f2339786797977ee997da3edce9413bd75bfc9997827f7c0d263558e54f132f82dd2f5302849f820d731abf67ae30a9bd757f006af711c3f1e')

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
