# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Deposite Pirate <dpirate at metalpunks dot info>

pkgname=castor-git
pkgver=0.9.0.r0.gec77c75
pkgrel=1
pkgdesc="A Gemini, Gopher and Finger protocol client"
arch=('i686' 'x86_64')
url="https://git.sr.ht/~julienxx/castor"
license=('MIT')
depends=('gcc-libs' 'glibc' 'atk' 'cairo' 'gdk-pixbuf2' 'gtk3' 'openssl' 'pango')
makedepends=('git' 'cargo')
provides=("castor=$pkgver")
conflicts=('castor')
source=("git+https://git.sr.ht/~julienxx/castor")
sha256sums=('SKIP')


prepare() {
  cd "castor"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "castor"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "castor"

  #cargo test \
  #  --frozen
}

package() {
  cd "castor"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path .
  make DESTDIR="$pkgdir" copy-data
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/castor"
}
