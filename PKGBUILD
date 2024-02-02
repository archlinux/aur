# Maintainer: Pierre Baconnier <orson.ouelles@outlook.com>
#https://wiki.archlinux.org/title/AUR_submission_guidelines

pkgname=fdispatcher-git
pkgver=0.3.0
pkgrel=1
pkgdesc="An easy-to-use file dispatcher based on extension"
arch=('x86_64')
url="https://github.com/pbackz/fdispatcher"
license=('MIT')
depends=('git' 'gcc' 'cargo')
makedepends=(cargo)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgbase=fdispatcher-git

source=("git+https://github.com/pbackz/fdispatcher")

prepare() {
  cd "$srcdir/fdispatcher"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/fdispatcher"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/fdispatcher"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/fdispatcher"
  find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}

sha256sums=('SKIP') 