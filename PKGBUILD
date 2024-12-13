# Maintainer: willemw <willemw12@gmail.com>
# Contributor: orhun <orhunparmaksiz@gmail.com>
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=hex-hx-git
pkgver=0.6.0.r1.ga708256
pkgrel=2
pkgdesc='Futuristic take on hexdump'
arch=(x86_64)
url=https://github.com/sitkevij/hex
license=(MIT)
makedepends=(cargo git)
provides=("${pkgname%-git}" hex)
conflicts=("${pkgname%-git}" hex)
#options=(!lto)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cd $pkgname
  cargo build --frozen --release --all-features
}

#check() {
#  export RUSTUP_TOOLCHAIN=stable
#  cd $pkgname
#  cargo test --frozen --all-features
#}

package() {
  install -Dm755 $pkgname/target/release/hx -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
