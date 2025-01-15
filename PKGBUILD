# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>

pkgname=groslaur-git
pkgver=r2.cb33038
pkgrel=1
pkgdesc="Shitty AUR helper"
arch=('any')
url="https://github.com/romch007/groslaur"
license=('MIT')
depends=('git' 'pacman' 'gcc-libs' 'openssl')
makedepends=('git' 'rust')
provides=("groslaur")
conflicts=('groslaur')
source=('git+https://github.com/romch007/groslaur.git')
md5sums=('SKIP')

pkgver() {
  cd "groslaur"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "groslaur"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

build() {
  cd "groslaur"

  cargo build -r
}

package() {
  cd "groslaur"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/groslaur"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/groslaur"
}
