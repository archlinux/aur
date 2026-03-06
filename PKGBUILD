# Maintainer: taotieren <admin@taotieren.com>

pkgname=sftool
pkgver=0.2.1
pkgrel=1
pkgdesc="A command-line utility for SiFli SoC serial tool."
arch=($CARCH)
url="https://github.com/OpenSiFli/sftool"
license=('Apache-2.0')
provides=(
    ${pkgname}
    ${pkgname}-bin
)
conflicts=(
    ${pkgname}
    ${pkgname}-bin
)
replaces=()
depends=(
    libgcc
    glibc
    systemd-libs
)
makedepends=(
    git
    rust
)
backup=()
options=(!lto !debug)
install=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('858f09d823a8bedd562de9276c37b6e68ff776d83e2c6239163fef790e3e672f')

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
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
    
    install -vDm0644 README* -t "$pkgdir/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
