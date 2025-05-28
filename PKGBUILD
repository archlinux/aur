# Maintainer: taotieren <admin@taotieren.com>

pkgname=gmv-rs
_name=${pkgname%-rs}
pkgver=1.01
pkgrel=1
pkgdesc="This is a video surveillance implementation based on GB28181: compatible with 2016 and 2022 versions."
arch=($CARCH)
url="https://github.com/epimore/gmv"
license=('MIT')
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
    openssl
    systemd-libs)
makedepends=(
    cargo
    cmake
    pkgconf)
backup=()
options=(!lto !debug)
install=
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e3acbcb1412b24af53b66541b46dcb472468eb1aa0a6b17ec8ffd343f8965f3e')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}/"

    sed -i 's|/home/ubuntu20/code/rs/mv/github/epimore/gmv/session/config.yml|/etc/gmv/session/config.yml|g' session/src/storage/entity.rs
    sed -i 's|/home/ubuntu20/code/rs/mv/github/epimore/gmv/session/config.yml|/etc/gmv/session/config.yml|g' session/src/storage/mapper.rs
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
    #     CFLAGS+=" -ffat-lto-objects"
    #    --features 'cli,ftdi' \
    #     cargo build \
    #         --offline \
    #         --locked \
    #         --release
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
    #     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm0644 session/config.yml "${pkgdir}/etc/gmv/session/config.yml"
    install -Dm0644 stream/readme "${pkgdir}/usr/share/doc/gmv/stream/readme"
    install -Dm0644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/

    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
