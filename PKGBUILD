# Maintainer: Akshat Ayush <akshatayush07 at gmail dot com>

# Note: There were no other packages for the zapp CLI tool currently.
# So I have preemptively added the `conflicts` field according to AUR conventions.

pkgname=zsa-zapp-git
pkgver=1.0.0.r1.gaaffabf
pkgrel=1
pkgdesc="Flash ZSA keyboards from your terminal."
arch=('x86_64')
url="https://github.com/zsa/zapp"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  unset CFLAGS CXXFLAGS LDFLAGS
  cargo build --release --locked --manifest-path zapp/Cargo.toml
}

package() {
  cd "$pkgname"
  install -vDm 755 "target/release/zapp" "$pkgdir/usr/bin/zapp"
  install -vDm 644 "udev/50-zsa.rules" "$pkgdir/usr/lib/udev/rules.d/50-zsa-zapp.rules"
  install -vDm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
