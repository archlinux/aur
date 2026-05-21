# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=wrkflw-git
_pkgname=wrkflw
pkgver=0.8.0.r3.g2f2892b
pkgrel=1
pkgdesc='Validate and Run GitHub Actions locally.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/bahdotsh/wrkflw'
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    'openssl'
    'libcrypto.so'
)
makedepends=(
    'cargo'
    'git'
)
options=(!lto !debug)
provides=('wrkflw')
conflicts=('wrkflw' 'wrkflw-bin')
source=("$_pkgname-main::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/wrkflw "$pkgdir/usr/bin/wrkflw"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
