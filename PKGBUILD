# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=typeracer-git
_pkgname=terminal-typeracer
pkgver=2.0.10.r0.g0be80e9
pkgrel=1
pkgdesc="Terminal typing speed tester (git)"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('sqlite' 'libgit2')
makedepends=('cargo' 'git' 'libssh2')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  cargo build --release --frozen
}

check() {
  cd "$_pkgname"
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
