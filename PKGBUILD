# Maintainer: taotieren <admin@taotieren.com>

pkgname=ectool-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Reusable flashing and UniLog tools for EigenComm cellular chips"
arch=($CARCH)
url="https://github.com/yuzhan-tech/ectool"
license=('MIT')
provides=(${pkgname%-rs})
conflicts=(${pkgname%-rs})
replaces=()
depends=(
    glibc
    libgcc_s.so
    systemd-libs
)
makedepends=(
    git
    rust
    pkgconf
)
optdepends=(
    "luatos-tools: A CLI for building, flashing, and debugging LuatOS firmware on EC618 / EC7xx modules"
)
backup=()
options=('!lto')
install=
source=("${pkgname%-rs}::git+${url}.git#tag=v${pkgver}")
sha256sums=('dbebefe3e65d8ff513843b24cbb9448c9104533bb70fe041eb24d396ebe04df2')

prepare() {
    git -C "${srcdir}/${pkgname%-rs}" clean -dfx
    cd "${srcdir}/${pkgname%-rs}/"
    cargo update -w
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname%-rs}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

# check() {
#     cd "${srcdir}/${pkgname}/"

#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${pkgname%-rs}/"

    export RUSTUP_TOOLCHAIN=stable
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0755 "target/release/${pkgname%-rs}" -t "${pkgdir}/usr/bin/"
}
