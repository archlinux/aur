# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: asukaminato <asukaminato@nyan.eu.org>

pkgname=rye-git
pkgver=0.22.0.r2.gbae3c95
pkgrel=2
pkgdesc="An experimental package management solution for Python"
arch=('i686' 'x86_64')
url="https://rye-up.com/"
license=('MIT')
depends=('gcc-libs' 'bzip2' 'libxcrypt-compat' 'openssl' 'zlib')
makedepends=('git' 'cargo')
provides=("rye=$pkgver")
conflicts=('rye')
options=('!lto')
source=("git+https://github.com/mitsuhiko/rye.git")
sha256sums=('SKIP')


prepare() {
  cd "rye"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "rye"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "rye"

  #cargo test \
  #  --frozen
}

package() {
  cd "rye"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "rye"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/rye"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rye"
}
