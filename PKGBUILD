# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=garbage-git
_pkgname=${pkgname%-git}
pkgver=v0.3.0.r1.gf7784c1
pkgrel=1
pkgdesc="Rust implementation of trash-cli, a tool that interfaces with Freedesktop's Trash spec"
url='https://sr.ht/~iptq/garbage/'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(cargo rust git)
conflicts=(garbage)
provides=(garbage)
source=("git+https://git.sr.ht/~iptq/garbage")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$_pkgname"
  cargo test --release --locked --all-features --target-dir=target
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
