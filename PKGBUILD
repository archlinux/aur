# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=git-guitar-git
_pkgname=guitar
pkgver=0.1.45.r7.g676c3d9
pkgrel=1
pkgdesc='A terminal based git client with fast topological & chronological graph rendering - Built form the main branch'
arch=(x86_64 aarch64)
url='https://github.com/asinglebit/guitar'
license=('GPL-3.0')
depends=(git)
makedepends=(cargo git)
options=(!lto)
provides=(${_pkgname%-*}=$pkgver)
conflicts=('git-guitar' 'git-guitar-bin')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export GUITAR_BUILD_OVERWRITE_VERSION="$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:

