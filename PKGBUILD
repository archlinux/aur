# Maintainer: jahala <jahala@users.noreply.github.com>
pkgname=tilth-git
pkgver=0.7.0.r0.g6f44b4a
pkgrel=1
pkgdesc="Smart(er) code reading for humans and AI agents."
arch=('x86_64')
url="https://github.com/jahala/tilth"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
options=('!lto')
provides=('tilth')
conflicts=('tilth')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  cargo test --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/tilth" "$pkgdir/usr/bin/tilth"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
