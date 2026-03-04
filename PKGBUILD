# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: SteamedFish <steamedfish@hotmail.com>
pkgname=zeroclaw
pkgver=0.1.7
pkgrel=1
pkgdesc="Zero overhead, fully autonomous AI assistant runtime (100% Rust)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/zeroclaw-labs/zeroclaw"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'clang' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zeroclaw-labs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "zeroclaw.service"
        "zeroclaw.sysusers"
        "zeroclaw.tmpfiles")
sha256sums=('8494d08a047a4d52546e7ba37dffa9aa0334f72c968357231f583dd395df2479'
            '54c38bdb24d359cdc9945290b2b27782249dea39c6d9998528e4b254837ab2ba'
            '5e22a9f53bab669beab7058c8b7d1c2b090eb7900fb8c9bd94fd3ad609e7afbf'
            '07911d8ca762bc87daf58e7d72ad9067517baedaeccd65f2ae7609962af8216f')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo-home"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # zeroclaw requires clang; gcc will not compile successfully
    export CC=clang
    export CXX=clang++
    export CARGO_HOME="$srcdir/.cargo-home"
    cargo build \
        --release \
        --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    # system service (systemctl enable --now zeroclaw)
    install -Dm644 "$srcdir/zeroclaw.service" "$pkgdir/usr/lib/systemd/system/zeroclaw.service"
    # system user and state directory
    install -Dm644 "$srcdir/zeroclaw.sysusers" "$pkgdir/usr/lib/sysusers.d/zeroclaw.conf"
    install -Dm644 "$srcdir/zeroclaw.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/zeroclaw.conf"
}
