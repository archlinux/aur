# Maintainer: Felix Wolff <lixissimus at gmail dot com>

pkgname=interception-fluent
pkgver=0.11.0
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
    'fluentd.service'
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
        "target/release/fluentd" \
        "target/release/fluentctl"
    install -Dm0644 -t "$pkgdir/etc/interception/udevmon.d/" "data/etc/interception/udevmon.d/fluent.yaml"
    install -Dm0644 "fluentd.service" "$pkgdir/usr/lib/systemd/system/fluentd.service"
    install -Dm0644 "udevmon.service.d" "$pkgdir/usr/lib/systemd/system/udevmon.service.d/interception-fluent.conf"
}

sha256sums=('3d90ced414f5f44e54ac5acbce36059dd20791d9ac5bfdadae01f7b65b75a99b'
            '8a8c3a88815e37fd1b1055a8c50d39513b9100d5965918455f8cfd6fd070c4e7'
            '2fad60b6d07a81191e0bce293fd068cb88d55b5f9f8d1dc02b8c95509526feda')
