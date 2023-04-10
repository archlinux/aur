# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: quininer kel <quininer@live.com>

pkgname=watchexec-git
pkgver=1.22.2.r1.g8e91d26
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
arch=('i686' 'x86_64')
url="https://watchexec.github.io/"
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("watchexec=$pkgver")
conflicts=('watchexec')
source=("git+https://github.com/watchexec/watchexec.git")
sha256sums=('SKIP')


prepare() {
  cd "watchexec"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "watchexec"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "watchexec"

  #cargo test \
  #  --frozen
}

package() {
  cd "watchexec"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "crates/cli"
}
