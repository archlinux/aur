# Maintainer: Felix Wolff <lixissimus at gmail dot com>

pkgname=interception-fluent
pkgver=0.10.0
pkgrel=1
pkgdesc='Interception plugin that allows to create arbitrary shortcuts'
url='https://github.com/Lixissimus/fluent'
license=(GPL-3.0-only)
makedepends=(
    'cargo'
    'git'
)
depends=('interception-tools')
arch=('x86_64')
install=interception-fluent.install
source=(
    "fluent-v$pkgver.tar.gz::https://github.com/Lixissimus/fluent/releases/download/v$pkgver/fluent-v$pkgver.tar.gz"
    'fluent-aggregator.service'
    'udevmon.service.d'
)

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" \
        "target/release/fluent" \
        "target/release/fluent-aggregator"
    install -Dm0644 -t "$pkgdir/etc/interception/udevmon.d/" "data/etc/interception/udevmon.d/fluent.yaml"
    install -Dm0644 "fluent-aggregator.service" "$pkgdir/usr/lib/systemd/system/fluent-aggregator.service"
    install -Dm0644 "udevmon.service.d" "$pkgdir/usr/lib/systemd/system/udevmon.service.d/interception-fluent.conf"
}

sha256sums=('c48c7b4f584b0b67ce9a76ad6c56847aa92b9e2230ebb0c632678b3bb4a7d2d4'
            '63bb17c16be4667349896b994179f0e3e8792343adb779b21b9c5d301d995e68'
            '237b106441e06d0277485913b357ddb2a016be6e3aa195a8d93ca24ce7605929')
