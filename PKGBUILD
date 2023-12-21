# Maintainer: taotieren <admin@taotieren.com>

pkgname=crm-git
pkgver=0.2.1.r3.g10e818c
pkgrel=6
pkgdesc="crm (Cargo registry manager)"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/wtklbm/crm"
license=('MIT' 'Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
