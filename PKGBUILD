# Maintainer: taotieren <admin@taotieren.com>

pkgname=chipmunk-rs
pkgver=4.1.0
pkgrel=1
pkgdesc="Fast Logfile Viewer for Analyzing Large Logfiles Chipmunk is a fast logfile viewer designed for analyzing large logfiles"
arch=($CARCH)
url="https://github.com/esrlabs/chipmunk"
license=('Apache-2.0')
provides=(${pkgname} ${pkgname%-rs})
conflicts=(${pkgname} ${pkgname%-rs})
replaces=()
depends=(
    libgcc_s.so
    hicolor-icon-theme
    openssl
    systemd-libs
)
makedepends=(
    git
    rust
    pkgconf
)
optdepends=(
    "ttf-ibm-plex: IBM Plex Mono, Sans, and Serif"
    "ttf-jetbrains-mono: Typeface for developers, by JetBrains"
)
backup=()
options=(!lto)
install=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('d41ad00398527c00e70f7c9334805eea5e04b66bbbbfc54626a4ae0f48d33efc')

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
    # CFLAGS+=" -ffat-lto-objects"
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
    install -vDm0755 target/release/${pkgname%-rs} -t "$pkgdir/usr/bin/"
    install -vDm0644 crates/app/data/linux/chipmunk.desktop -t ${pkgdir}/usr/share/applications/
    local _icon
    for _icon in 16 24 32 64 128 256 512; do
        if [ -f "crates/app/data/icons/png/${_icon}.png" ]; then
            install -Dm0644 "crates/app/data/icons/png/${_icon}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/chipmunk.png"
        fi
    done
    install -vDm0644 crates/app/data/linux/chipmunk.png -t ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
