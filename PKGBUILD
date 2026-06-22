# Maintainer: Clément Hamada <clementhamada@protonmail.com>

pkgname=ddcci-discover-git
pkgver=0.1.0.r0.g5b883e4
pkgrel=1
pkgdesc='Detects monitor connection status and attaches/detaches DDC/CI devices'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://codeberg.org/ClemaX/ddcci-discover'
license=('Apache-2.0')
makedepends=('git' 'cargo')
depends=('glibc')
provides=('ddcci-discover')
conflicts=('ddcci-discover')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | grep host | awk '{print $2}')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm0755 "$srcdir/$pkgname/target/release/ddcci-discover" "$pkgdir/usr/bin/ddcci-discover"
  install -Dm0644 "$srcdir/$pkgname/99-ddcci-discover.rules" "$pkgdir/usr/lib/udev/rules.d/99-ddcci-discover.rules"
}
