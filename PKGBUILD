# Maintainer: Ali <Im_wrench@proton.me>

pkgname=allp-manager-git
_pkgname=allp-manager
pkgver=0.3.5.r0.g0000000
pkgrel=1
pkgdesc="A transparent package-manager orchestrator for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/allp-manager/allp-manager"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('allp' 'allp-manager')
conflicts=('allp' 'allp-manager')
source=("git+https://github.com/allp-manager/allp-manager.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "0.3.5.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$_pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo test --frozen --release --lib
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "target/release/allp" "$pkgdir/usr/bin/allp"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
