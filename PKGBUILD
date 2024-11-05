# Maintainer: aarto <aarto@archlinux.org>
pkgname=mtracker-git
_pkgname=mtracker
pkgver=0.4.0.r2.g497e6b3
pkgrel=1
pkgdesc='cli movie tracker - keep track of watched movies and series'
url='https://github.com/r-unruh/mtracker'
license=('MIT')
arch=('x86_64')
makedepends=(cargo)
provides=('mtracker')
conflicts=('mtracker')
source=("git+https://github.com/r-unruh/mtracker")
b2sums=('SKIP')

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
