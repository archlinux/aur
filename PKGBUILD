# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-box-rust-git
pkgver=2.3.0.rust.1.r4.g7cbcb6c
pkgrel=1
pkgdesc="Linyaps OCI runtime implemented in Rust A command-compatible Rust implementation of the Linyaps OCI runtime"
arch=($CARCH)
url="https://github.com/guanzi008/linyaps-box-rust"
license=('LGPL-3.0-or-later')
provides=(${pkgname%-git} ${pkgname%-rust-git})
conflicts=(${pkgname%-git} ${pkgname%-rust-git})
replaces=()
depends=(
    libgcc_s.so
)
makedepends=(
    git
    rust
    pkgconf
)
optdepends=()
backup=()
options=(!lto !debug)
install=
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    #     cargo build --release --all-features
    # CFLAGS+=" -ffat-lto-objects"
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
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    #     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -vDm0755 -t "$pkgdir/usr/bin/" {} +
    
    install -vDm0644 debian/*.1 -t ${pkgdir}/usr/share/man/man1/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    cp -rv LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/"
}
