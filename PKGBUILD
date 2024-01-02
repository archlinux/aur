# Maintainer: fossdd <fossdd@pwned.life>
pkgname=granex-git
_pkgname=${pkgname%-git}
pkgver=r1.c16d188
pkgrel=1
pkgdesc="Vanity address generator for TOR onion v3 (ed25519) "
url='https://github.com/dotcypress/granex'
license=(Apache-2.0)
arch=(x86_64)
depends=()
makedepends=(cargo rust-nightly git)
conflicts=()
provides=(granex)
source=("git+https://github.com/dotcypress/granex")
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
  cargo build --release
}

check() {
  cd "$_pkgname"
  cargo test --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
