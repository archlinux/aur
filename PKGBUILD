# Maintainer: Jenny Danzmayr <mail@evilscientress.de>

pkgname="statime"
pkgver=0.4.0
_tag=acb88a87a2184c36003608f11fc153650c4f8cf1
pkgrel=1
pkgdesc='Statime is a work in progress Rust implementation of PTP version 2.1 (IEEE 1588-2019). It currently implements support for acting as a master and an ordinary or a boundary clock.'
url='https://github.com/pendulum-project/statime/'
license=('MIT' 'ASL 2.0')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
    "$pkgname"::"git+https://github.com/pendulum-project/statime#tag=$_tag"
    "statime-metrics-exporter.service"
    "statime.sysusers"
)
b2sums=(
    'ee61291c16c8df6bc0092fcafe4df00c7a26b91b30b67f7c5f8eb53bf3ec4bcbf5a63ed02cc9f38838f9726cd8a99ca55331a5d9786deb6b61f34c5272bd1ec0'
    'e3846d921a8c9c13699f6bbc1b6f3e564c9ab3cdc9994020dee15e732f046ab026cc30e6a7c301560280148d217597a181a3b089933eed3fe5626b7bfca4d1d0'
    '03cb77ee1cda565e7d59944fe4db208235935e2e517afbbcf1568bd0b0e616ec1899d1cc309c215447bbe3361f9cc42bbcbb373e3b8067135a9c1c90fa1c1bf2'
)

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"1
    cargo build --frozen --release --all-features --package statime-linux
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/statime-metrics-exporter"
    install -Dm644 "docs/precompiled/man/statime.8" "${pkgdir}/usr/share/man/man8/statime.8"
    install -Dm644 "docs/precompiled/man/statime-metrics-exporter.8" "${pkgdir}/usr/share/man/man8/statime-metrics-exporter.8"
    install -Dm644 "docs/precompiled/man/statime.toml.5" "${pkgdir}/usr/share/man/man5/statime.toml.5"
    install -Dm644 "docs/examples/conf/statime.toml.default" "${pkgdir}/usr/share/doc/statime/statime.toml.default"
    install -Dm644 "docs/examples/conf/statime.toml.default" "${pkgdir}/etc/statime/statime.toml"
    install -Dm644 "docs/examples/conf/statime.preset" "${pkgdir}/usr/lib/systemd/system-preset/50-statime.preset"
    install -Dm644 "docs/examples/conf/statime.service" "${pkgdir}/usr/lib/systemd/system/statime.service"
    install -Dm644 "docs/examples/conf/41-statime.rules" "${pkgdir}/etc/udev/rules.d/41-statime.rules"
    install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

    cd "$srcdir"
    install -Dm644 "statime-metrics-exporter.service" "${pkgdir}/usr/lib/systemd/system/statime-metrics-exporter.service"
    install -Dm644 "${pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
}
