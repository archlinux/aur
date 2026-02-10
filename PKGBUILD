# Maintainer: Your Name <your-email@address.com>
pkgname=chainlink-git
_pkgname=chainlink
pkgver=chainlink.1.5.r11.g8abb364
pkgrel=1
pkgdesc="An issue tracker for agents (VCS version)"
arch=('x86_64')
url="https://github.com/dollspace-gay/chainlink"
license=('MIT') # Based on the repo's LICENSE file
depends=('gcc-libs' 'sqlite')
makedepends=('git' 'cargo' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/dollspace-gay/chainlink.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # This looks for the latest tag (1.5.1) and formats it
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname/chainlink"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname/chainlink"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # This line ensures the linker finds system sqlite
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname/chainlink"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install license if available
  install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
