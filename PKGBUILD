# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-rust-git
_tagname=1.14.0-rust.1
pkgver=1.14.0.rust.1.r6.g38b279b
pkgrel=6
pkgdesc="Linyaps package manager implemented in Rust A command-compatible Rust implementation of the Linyaps package manager"
arch=($CARCH)
url="https://github.com/guanzi008/linyaps-rust"
license=('LGPL-3.0-or-later')
provides=(${pkgname%-git} ${pkgname%-rust-git})
conflicts=(${pkgname%-git} ${pkgname%-rust-git})
replaces=()
depends=(
    sh
    libgcc_s.so
    fuse-overlayfs
    hicolor-icon-theme
    linyaps-box-rust
)
makedepends=(
    git
    rust
    pkgconf
)
optdepends=()
backup=()
options=(!lto !debug)
install=${pkgname%-git}.install
source=(
    "git+${url}.git"
    "${pkgname%-git}.install"
)
sha256sums=('SKIP'
            '8dee25390fcf12a621dd50fcf3b8545ff8ec69aa961f5e0264e57c0eeaf1b0eb')

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
    # find target/release \
    #     -maxdepth 1 \
    #     -executable \
    #     -type f \
    #     -exec install -vDm0755 -t "$pkgdir/usr/bin/" {} +
    install -vDm0755 target/release/ll-cli -t $pkgdir/usr/bin/
    install -vDm0755 target/release/llpkg -t $pkgdir/usr/bin/
    install -vDm0755 target/release/ll-init -t $pkgdir/usr/libexec/linglong/
    install -vDm0755 target/release/ll-driver-detect -t $pkgdir/usr/libexec/linglong/
    install -vDm0755 target/release/ll-package-manager -t $pkgdir/usr/libexec/linglong/
    install -vDm0755 target/release/ll-system-helper -t $pkgdir/usr/libexec/linglong/
    install -vDm0644 debian/linglong.conf -t ${pkgdir}/usr/lib/sysctl.d/
    install -vDm0644 debian/*.1 -t ${pkgdir}/usr/share/man/man1/
    cp -rv misc/etc ${pkgdir}/
    cp -rv misc/{lib,share} ${pkgdir}/usr
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    cp -rv LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/"
}
