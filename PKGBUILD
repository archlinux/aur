# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=usleep_chocobo1-git
pkgver=r9.gc3485ce
pkgrel=2
pkgdesc="Sleep microseconds"
arch=('i686' 'x86_64')
url="https://github.com/Chocobo1/usleep"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("usleep_chocobo1=$pkgver")
conflicts=('usleep_chocobo1')
source=("git+https://github.com/Chocobo1/usleep.git")
sha256sums=('SKIP')


prepare() {
  cd "usleep"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "usleep"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

check() {
  cd "usleep"

  cargo test \
    --frozen
}

package() {
  cd "usleep"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/usleep_chocobo1"
}
