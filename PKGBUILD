# Maintainer: taotieren <admin@taotieren.com>

pkgname=hpm-isp
pkgver=0.5.0
pkgrel=5
pkgdesc="An ISP (In-system programming) tool for HPMicro MCUs"
arch=($CARCH)
url="https://github.com/tfx2001/hpm_isp"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    libgcc_s.so
    systemd-libs
)
makedepends=(
    git
    rust
    cmake
    openssl
    pkgconf
)
backup=()
options=(!lto !debug)
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('71388ced61472581637724a281907a980b1c645b7cd6be380068ab2225efeb74')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #     cargo build --release --all-features
    CFLAGS+=" -ffat-lto-objects"
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
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    #     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    #     find target/release \
    #         -maxdepth 1 \
    #         -executable \
    #         -type f \
    #         -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
    install -vDm0755 target/release/${pkgname//-/_} "$pkgdir/usr/bin/${pkgname}"
    install -vDm644 "99-hpm_bootrom.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
