# Maintainer: blitzkriegfc <blitzkriegfc@gmail.com>
pkgname=qbzd
pkgver=2.1.0
pkgrel=1
pkgdesc="QBZ headless Qobuz daemon for servers and appliances"
arch=('x86_64' 'aarch64')
url="https://github.com/vicrodh/qbz"
license=('MIT')
depends=('alsa-lib')
makedepends=('rust' 'cmake' 'nasm' 'jack2')
# makepkg's GCC LTO objects cannot be consumed from Rust rlibs by rustc's lld.
options=('!lto' '!debug')
install=qbzd.install
optdepends=(
    'pipewire: PipeWire device discovery and sample-rate control'
    'libpulse: PulseAudio device discovery and routing through pactl'
    'jack2: JACK audio backend'
    'xdg-utils: Open the login URL in a browser when one is available'
)
provides=('qbzd')
conflicts=('qbzd-bin' 'qbzd-git')
source=(
    "qbz-${pkgver}.tar.gz::https://github.com/vicrodh/qbz/archive/refs/tags/v${pkgver}.tar.gz"
    "qbz-${pkgver}-cargo-vendor.tar.xz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbz-${pkgver}-cargo-vendor.tar.xz"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd "${srcdir}/qbz-${pkgver}"
    mkdir -p .cargo
    printf '%s\n' \
        '[source.crates-io]' \
        'replace-with = "vendored-sources"' \
        '' \
        '[source.vendored-sources]' \
        "directory = \"${srcdir}/qbz-${pkgver}-cargo-vendor\"" \
        '' \
        '[net]' \
        'offline = true' > .cargo/config.toml
}

build() {
    cd "${srcdir}/qbz-${pkgver}"
    cargo build --release --locked --offline \
        --manifest-path crates/Cargo.toml -p qbzd
}

package() {
    cd "${srcdir}/qbz-${pkgver}"
    local binary=crates/target/release/qbzd

    install -Dm755 "$binary" "${pkgdir}/usr/bin/qbzd"
    install -Dm644 crates/qbzd/service/qbzd.service \
        "${pkgdir}/usr/lib/systemd/user/qbzd.service"

    "$binary" completions bash > "${srcdir}/qbzd.bash"
    "$binary" completions zsh > "${srcdir}/qbzd.zsh"
    "$binary" completions fish > "${srcdir}/qbzd.fish"
    install -Dm644 "${srcdir}/qbzd.bash" "${pkgdir}/usr/share/bash-completion/completions/qbzd"
    install -Dm644 "${srcdir}/qbzd.zsh" "${pkgdir}/usr/share/zsh/site-functions/_qbzd"
    install -Dm644 "${srcdir}/qbzd.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/qbzd.fish"
    install -Dm644 packaging/linux/qbzd-standalone-README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}/third-party"
}
