# Maintainer: taotieren <admin@taotieren.com>

pkgname=gmv-rs
_name=${pkgname%-rs}
pkgver=0.1
pkgrel=1
pkgdesc="A debugging toolset and library for debugging embedded ARM and RISC-V targets on a separate host"
arch=($CARCH)
url="https://github.com/epimore/gmv"
license=('Apache-2.0')
provides=(
    ${_name}
    gmv-session
    gmv-stream
)
conflicts=(
    ${_name}
    gmv-session
    gmv-stream
)
replaces=()
depends=(
    gcc-libs
    glibc
    systemd-libs)
makedepends=(
    cargo
    cmake
    openssl
    pkgconf)
backup=()
options=(!lto !debug)
install=
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b5d08b615c17b87a6d3c9aea2ff9c0359d20def61867bcc6ab2fac3531bd2ef5')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}/"

    sed -i 's|/home/ubuntu20/code/rs/mv/github/epimore/gmv/session/config.yml|/etc/gmv/session/config.yml|g' session/src/storage/entity.rs
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #     cargo build --release --all-features
    #     CFLAGS+=" -ffat-lto-objects"
    #    --features 'cli,ftdi' \
    cargo build \
        --offline \
        --locked \
        --release
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm0644 session/config.yml "${pkgdir}/etc/gmv/session/config.yml"
    #     find target/release \
    #         -maxdepth 1 \
    #         -executable \
    #         -type f \
    #         -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
