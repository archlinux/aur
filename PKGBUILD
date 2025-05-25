# Maintainer: Jenny Danzmayr <mail@evilscientress.de>

_pkgname=statime
pkgname="${_pkgname}-git"
pkgver=0.2.0+199+gacb88a8
pkgrel=1
pkgdesc='Statime is a work in progress Rust implementation of PTP version 2.1 (IEEE 1588-2019). It currently implements support for acting as a master and an ordinary or a boundary clock.'
url='https://github.com/pendulum-project/statime/'
license=('MIT' 'ASL 2.0')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
    "$_pkgname"::"git+https://github.com/pendulum-project/statime"
    "statime-metrics-exporter.service"
    "statime.sysusers"
)
b2sums=(
    'SKIP'
    'e3846d921a8c9c13699f6bbc1b6f3e564c9ab3cdc9994020dee15e732f046ab026cc30e6a7c301560280148d217597a181a3b089933eed3fe5626b7bfca4d1d0'
    '03cb77ee1cda565e7d59944fe4db208235935e2e517afbbcf1568bd0b0e616ec1899d1cc309c215447bbe3361f9cc42bbcbb373e3b8067135a9c1c90fa1c1bf2'
)
provides=(
  "$_pkgname"
)
conflicts=("$_pkgname")

pkgver() {
    cd "$_pkgname"
    git describe --tags | sed -r 's|v?(.+)|\1|'|sed 's|-|+|g'
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"1
    cargo build --frozen --release --all-features --package statime-linux
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/statime-metrics-exporter"
    install -Dm644 "docs/precompiled/man/statime.8" "${pkgdir}/usr/share/man/man8/statime.8"
    install -Dm644 "docs/precompiled/man/statime-metrics-exporter.8" "${pkgdir}/usr/share/man/man8/statime-metrics-exporter.8"
    install -Dm644 "docs/precompiled/man/statime.toml.5" "${pkgdir}/usr/share/man/man5/statime.toml.5"
    install -Dm644 "docs/examples/conf/statime.toml.default" "${pkgdir}/usr/share/doc/statime/statime.toml.default"
    install -Dm644 "docs/examples/conf/statime.toml.default" "${pkgdir}/etc/statime/statime.toml"
    install -Dm644 "docs/examples/conf/statime.preset" "${pkgdir}/usr/lib/systemd/system-preset/50-statime.preset"
    install -Dm644 "docs/examples/conf/statime.service" "${pkgdir}/usr/lib/systemd/system/statime.service"
    install -Dm644 "docs/examples/conf/41-statime.rules" "${pkgdir}/etc/udev/rules.d/41-statime.rules"
    install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"

    cd "$srcdir"
    install -Dm644 "statime-metrics-exporter.service" "${pkgdir}/usr/lib/systemd/system/statime-metrics-exporter.service"
    install -Dm644 "${_pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
}
