# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Trevor Bentley <trevor@trevorbentley.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=circadian
pkgver=0.8.2
pkgrel=2
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
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "w_arg.patch")
b2sums=('c80c523c4438d6dddb1441deecf98c54eb401f7f764bb47fda18490e4a2dcb3da98b5268025950dd78caab2d9ac152ec73cb030a25c77168818871017df8171c'
        'b7236454060def7fc91800cbbc0f775fd51c5f58c259ecd7db8959ef1849fcaf44309d89ffb1d63101737d21fb78de6a3d8299d3889dacc93d77b035d1e47a16')
backup=('etc/circadian.conf')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Arch does not enable the `-f` option for the `w` command per default
    patch --forward --strip=1 --input="${srcdir}/w_arg.patch"

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
