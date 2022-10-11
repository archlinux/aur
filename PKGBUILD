# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=shotman-git
_pkgname=shotman
pkgver=0.2.0.r6.ge4e7b3e
pkgrel=1
pkgdesc="Uncompromising screenshot GUI for Wayland"
arch=("x86_64" "aarch64")
url="https://git.sr.ht/~whynothugo/shotman"
license=('ISC')
depends=("libxkbcommon")
optdepends=(
    "sway: screenshots of a single window on swaywm"
    "slurp-git: screenshots of a region on swaywm"
)
makedepends=("git" "cargo")
source=("$pkgname::git+https://git.sr.ht/~whynothugo/shotman")
sha512sums=("SKIP")
validpgpkeys=("1204CA9FC2FFADEEDC2961367880733B9D062837")
conflicts=(shotman)
provides=(shotman)

pkgver() {
  cd "$srcdir/$pkgname"

  # cutting off 'v' prefix that presents in the git tag.
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
