# Maintainer: Mark Collins

pkgname=vykar-server
_name=vykar
pkgver=0.17.0
pkgrel=1
pkgdesc='Fast, encrypted, deduplicated backups in Rust - only server component'
url='https://github.com/borgbase/vykar'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'cairo' 'pango' 'atk')
depends=('glibc' 'libgcc' 'libstdc++')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
  "${_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "${pkgname}.service"
)
b2sums=('7eda7a5ca6067a2ee9ad2c90747044af7f320d93d1e704dfc5c8c200191e1758bb0ea8554d5dc446a17244198f4efd1847cd2fb1bccf7f97c2269530b6a4458a'
        'a50fbfaf866dd1953ad5448a56569fd703498b1a78034906f316932b648da2d4bc74f0154a9440fd4f4dc42c41fcf732febf7c83c28bf51c37ae906ad1e280c9')
options=(!lto)

prepare() {
    cd "${_name}-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${_name}-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # https://github.com/aws/aws-lc-rs/issues/1008#issuecomment-3774105038
    export AWS_LC_SYS_NO_JITTER_ENTROPY=1
    cargo build --frozen --release --package vykar-server
}

check() {
    cd "${_name}-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --package vykar-server
}

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${_name}-${pkgver}/target/release/$pkgname"
    install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "${pkgname}.service"
}


