# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=static-web-server-git
pkgver=2.18.0.r10.g3adf75e
pkgrel=1
pkgdesc="A cross-platform, high-performance and asynchronous web server for static files-serving"
arch=('i686' 'x86_64')
url="https://static-web-server.net/"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("static-web-server=$pkgver")
conflicts=('static-web-server')
source=("git+https://github.com/static-web-server/static-web-server.git")
sha256sums=('SKIP')


prepare() {
  cd "static-web-server"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "static-web-server"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "static-web-server"

  #cargo test \
  #  --frozen
}

package() {
  cd "static-web-server"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/static-web-server"
}
