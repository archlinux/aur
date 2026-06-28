# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=influxdb3
pkgver=3.10.0
_commit=a1e8994464c3fe0b44ee85e95c0714ad557ed7fc
pkgrel=1
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('x86_64')
url='https://www.influxdata.com/products/influxdb3/'
license=('Apache-2.0' 'MIT')
depends=('python')
makedepends=('cargo' 'protobuf')
source=(
    "https://github.com/influxdata/influxdb/archive/refs/tags/v$pkgver.tar.gz"
    'influxdb3.sysusers'
    'influxdb3.tmpfiles'
)
b2sums=(
    '3331b71d5677124dcb42235b193b32efb4d944e15f16fa7f2393841a14aedcd03e2a52cc451f37e76c613309e32b2f5e6aca258a1f750203a5dee7ce02f5d48f'
    '1f119aaed81914fcb75098dde95f894c52b11d825eb5a9bca21848a88c1e85d1dc5e6044aeb14465d9e0cec294ac9b15b505cdf275a31e439ac53044e0f651aa'
    'c00c44696c9ff81d2c9b840d434c3bdbdd5c8265ec75b2697e6414c648c075e61708cbab7ce988421b6eacbf6f6bcb5496713b952121aa22c691a48874e03dd2'
)
backup=('etc/influxdb3/influxdb3-core.conf')

prepare() {
    cd influxdb-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd influxdb-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export GIT_HASH=$_commit
    CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --all-features
}

check() {
    cd influxdb-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm644 influxdb3.sysusers "$pkgdir/usr/lib/sysusers.d/influxdb3.conf"
    install -Dm644 influxdb3.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/influxdb3.conf"

    cd influxdb-$pkgver
    _fsdir=.circleci/packages/influxdb3/fs
    install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/influxdb3"
    install -Dm644 $_fsdir/lib/systemd/system/influxdb3-core.service -t "$pkgdir/usr/lib/systemd/system"
    sed -i \
        -e 's|^ExecStart=/usr/lib/influxdb3/python/bin/python3|ExecStart=/usr/bin/python3|' \
        -e 's|^Type=simple|Type=exec|' \
        "$pkgdir/usr/lib/systemd/system/influxdb3-core.service"
    install -Dm644 $_fsdir/usr/share/influxdb3/influxdb3-core.conf -t "$pkgdir/etc/influxdb3"
    install -Dm644 $_fsdir/usr/lib/influxdb3/influxdb3-launcher -t "$pkgdir/usr/lib/influxdb3"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
