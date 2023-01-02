# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Trevor Bentley <trevor@trevorbentley.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=circadian
pkgver=0.8.1
pkgrel=1
pkgdesc="Linux auto-suspend/wake power management daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/mrmekon/${pkgname}"
license=('GPL3')
depends=('awk' 'coreutils' 'gcc-libs' 'grep' 'sed' 'sh')
makedepends=('cargo')
optdepends=('xssstate: for monitoring x11 input'
    'xprintidle: for monitoring x11 input'
    'procps: for monitoring tty input, uptime or processes'
    'net-tools: for monitoring nfs, smb or ssh')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ffee3d713b27f39f52a9deb6c1e5c86ff376211fde5efbc54de68aa7e5395010e7eeab4eab6d167665e3c4c1a73fe80570282bfba8a4485189c698c0c119b8e9')
backup=('etc/circadian.conf')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm0644 -T "resources/circadian.conf.in" "${pkgdir}/etc/circadian.conf"
    install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "resources/circadian.service"
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
}
