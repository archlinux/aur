# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=gitpane-git
_pkgname=gitpane
pkgver=0.8.2.r0.g32331e3
pkgrel=1
pkgdesc='Multi-repo Git workspace dashboard for the terminal'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/affromero/gitpane'
license=('MIT')
depends=('git')
makedepends=(
    'cargo'
    'patch'
    'git'
)
options=(
    !lto
    !debug
)
provides=('gitpane')
conflicts=('gitpane' 'gitpane-bin')
source=(
    "$_pkgname-main::git+$url.git#branch=main"
    'disable-self-updates.patch'
)
sha256sums=(
    'SKIP'
    '5b6b6bd1ab83ddf83484106219ffdb06cd52e17a0803ed0d0c28493f74ecbca2'
)

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    patch -p1 < ../disable-self-updates.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export GITPANE_BUILD_OVERWRITE_VERSION="$pkgver" # https://github.com/affromero/gitpane/pull/4
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/gitpane "$pkgdir/usr/bin/gitpane"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
