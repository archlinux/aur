# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
# Maintainer: Eric Kochen <eric@getpurple.sh>
pkgname=purple-git
_pkgname=purple
pkgver=3.12.3.r0.g1ed5ffe
pkgrel=1
pkgdesc='Terminal SSH manager with provider sync, tunnels, file transfer and containers'
arch=('x86_64' 'aarch64')
url='https://github.com/erickochen/purple'
license=('MIT')
depends=('gcc-libs' 'openssh')
makedepends=('cargo' 'git')
options=(!lto)
provides=('purple')
conflicts=('purple' 'purple-bin')
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin" 'target/release/purple'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
