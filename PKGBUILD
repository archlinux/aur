# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Trevor Bentley <trevor@trevorbentley.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=circadian
pkgver=0.8.3
pkgrel=1
pkgdesc="Linux auto-suspend/wake power management daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/mrmekon/${pkgname}"
license=('GPL3')
depends=('awk' 'coreutils' 'gcc-libs' 'grep' 'sed' 'sh')
makedepends=('cargo')
optdepends=(
    'xssstate: for monitoring x11 input'
    'xprintidle: for monitoring x11 input'
    'procps: for monitoring tty input, uptime or processes'
    'net-tools: for monitoring nfs, smb or ssh'
    'pulseaudio: audio detection support via pacmd')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d70793398437bf4fa37d27d7054cc24bbf0eef1680f832a15f94cf127f66d8d44150dcefee2ecbc66ecc45d240d04c896b59e7d0cf72f3ac9d2df57f134a3718')
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
