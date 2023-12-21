# Maintainer: taotieren <admin@taotieren.com>

pkgname=airisp-next-git
pkgver=r41.760d231
pkgrel=2
pkgdesc="An ISP tool for Air MCU (Rust)"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/Air-duino/AirISP-next"
license=('unknow')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=('cargo')
makedepends=(git
    rust
    mold)
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
#     git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    mold -run cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
#     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm0755 target/release/AirISP-next "$pkgdir/usr/${pkgname%-git}"
}
