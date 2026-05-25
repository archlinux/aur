# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>

_pkgname=enneagram
pkgname="$_pkgname-git"
pkgver=1.1.0.dfde688
pkgrel=1
pkgdesc="An exploration into the enneagram. (git version)"
url="https://github.com/sigurd4/$_pkgname"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=()
makedepends=('git' 'rust' 'base-devel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(cargo pkgid | sed "s/^.*#//g").$(git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --offline --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features 
} 

check() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --frozen -- --skip "config"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
