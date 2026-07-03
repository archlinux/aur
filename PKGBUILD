# Maintainer: Brumaire <brumaire AT entalpi DOT net>

pkgname=gempost-git
pkgver=0.3.0.r2.g9698b80
pkgrel=1
pkgdesc="minimal static site generator for publishing a blog (gemlog) on the Gemini protocol."
arch=('any')
url="https://github.com/justlark/gempost.git"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("gempost")
conflicts=('gempost')
options=('staticlibs')
source=("git+https://github.com/justlark/gempost.git")
sha256sums=('SKIP')
 
pkgver() {
  cd "gempost"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "gempost"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

build() {
 cd "gempost"
 export RUSTUP_TOOLCHAIN=stable
 export CARGO_TARGET_DIR=target
 cargo build --frozen --release --all-features
}
 

check() {
 cd "gempost"
 export RUSTUP_TOOLCHAIN=stable
 cargo test --frozen --all-features
}

package() {
  cd "gempost"
  install -Dm 755 target/release/gempost -t "${pkgdir}/usr/bin"
}
