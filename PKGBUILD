# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=lqth-git
_pkgname=lqth
pkgver=0.2.5.r3.g44f3cb4
pkgrel=1
pkgdesc='Simple but blazingly fast screenshot utility'
arch=('x86_64')
url='https://github.com/0x61nas/lqth'
license=('MIT')
makedepends=('cargo' 'libx11')
provides=('lqth')
conflicts=('lqth')
source=("$_pkgname::git+$url.git#branch=aurora")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
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
    install -Dm0755 'target/release/lqth' "$pkgdir/usr/bin/lqth"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/man/man1/" man/lqth.1
    command -v gzip >/dev/null 2>&1 && gzip -9 "$pkgdir/usr/share/man/man1/lqth.1"
}

