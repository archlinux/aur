# Maintainer: taotieren <admin@taotieren.com>

pkgname=linyaps-rust
_tagname=1.14.0-rust.1
pkgver=${_tagname//-/+}
pkgrel=6
pkgdesc="Linyaps package manager implemented in Rust A command-compatible Rust implementation of the Linyaps package manager"
arch=($CARCH)
url="https://github.com/guanzi008/linyaps-rust"
license=('LGPL-3.0-or-later')
provides=(${pkgname} ${pkgname%-rust})
conflicts=(${pkgname} ${pkgname%-rust})
replaces=()
depends=(
    sh
    libgcc_s.so
    desktop-file-utils
    erofs-utils
    erofsfuse
    fuse-overlayfs
    hicolor-icon-theme
    polkit
    shared-mime-info
    linyaps-box-rust
)
makedepends=(
    git
    rust
    pkgconf
)
checkdepends=(
    dbus
)
optdepends=()
backup=()
options=(!lto !debug)
install=${pkgname}.install
source=(
    "git+${url}.git#tag=v${_tagname}"
    "${pkgname}.install"
)
sha256sums=('04988ae4fcaf10a910d6e0f89a670f09398040df0419f922aeafe04b191724fb'
            '8dee25390fcf12a621dd50fcf3b8545ff8ec69aa961f5e0264e57c0eeaf1b0eb')

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
    cargo build --offline --locked --release --workspace --exclude ll-init
    cargo rustc --offline --locked --release --package ll-init -- -C target-feature=+crt-static
}

# check() {
#     cd "${srcdir}/${pkgname}/"

#     export CARGO_TARGET_DIR=target
#     export RUSTUP_TOOLCHAIN=stable
#     dbus-run-session -- cargo test --offline --locked --workspace
# }

package() {
    cd "${srcdir}/${pkgname}/"
    ./target/release/ll-system-helper install \
        --destdir "${pkgdir}" \
        --prefix /usr \
        --binary-dir target/release

    # install -vDm0644 debian/*.1 -t ${pkgdir}/usr/share/man/man1/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    cp -rv LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/"
}
