# Maintainer: Medispis <https://github.com/medispis>

pkgname=clock.rs-git
_pkgname=clock.rs
pkgver=r11.99789e9
pkgrel=1
pkgdesc="A simple terminal clock written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/medispis/clock.rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("clock.rs")
conflicts=("clock.rs")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo generate-lockfile
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  cargo build --release --offline
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/clock" "$pkgdir/usr/bin/clock.rs"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
