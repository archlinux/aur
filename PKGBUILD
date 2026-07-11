# Maintainer: taotieren <admin@taotieren.com>

pkgname=cargo-packager
pkgver=0.11.8
pkgrel=1
pkgdesc="A cli tool and library to generate installers or app bundles for your executables"
arch=($CARCH)
url="https://github.com/crabnebula-dev/cargo-packager"
license=('Apache-2.0 OR MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    libgcc
)
makedepends=(
    git
    rust
    pkgconf
)
backup=()
options=('!lto')
install=
source=("${pkgname}::git+${url}.git#tag=cargo-packager-v${pkgver}")
sha256sums=('cbfce8d7b808c90d8a1fde68b542bbb7048e2b306c6ee91d00a12c329b09f0e9')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # 仅构建核心 crate，跳过 wry/slint/dioxus/tauri 等示例（它们需要额外 GUI 依赖如 libxdo）
    cargo build --release --all-features -p cargo-packager
}

# check() {
#     cd "${srcdir}/${pkgname}/"

#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}
