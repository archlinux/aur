# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=qqm
_pkgname=QQMusicApi-rs
pkgver=0.0.4
pkgrel=1
pkgdesc="go-musicfox style QQ Music terminal player with background daemon and MPRIS support"
arch=('x86_64' 'aarch64')
url="https://github.com/jinzhongjia/QQMusicApi-rs"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'alsa-lib')
makedepends=('rust' 'cargo')
conflicts=('qqm-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('21a3cfa06176c8c91942dbe8cb1fc2e296c07b42c9047d218d38c64433a4110f')

prepare() {
    cd "${_pkgname}-${pkgver}"

    export CARGO_HOME="${srcdir}/.cargo"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-${pkgver}"

    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    local _sysroot
    _sysroot="$(rustc --print sysroot)"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/${_pkgname}-${pkgver}=/build/qqm --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry --remap-path-prefix=${_sysroot}=/rust-sysroot"
    cargo build --frozen --release -p qqmusic-tui --bin qqm
}

package() {
    cd "${_pkgname}-${pkgver}"

    install -Dm755 "target/release/qqm" "${pkgdir}/usr/bin/qqm"
    install -Dm644 crates/qqmusic-tui/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
