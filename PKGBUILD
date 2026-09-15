# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-shadow
pkgver=0.5.1
pkgrel=1
pkgdesc="A memory-safe reimplementation of the Linux shadow-utils in Rust"
arch=('i686' 'x86_64')
url="https://github.com/uutils/shadow"
license=('MIT')
depends=('glibc' 'libgcc' 'libxcrypt' 'pam')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/shadow/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0fa862fb8c425cbce747c86e783ffd07ec7870781204207e42125a18254d9161')


prepare() {
  cd "shadow-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "shadow-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "shadow-$pkgver"

  # Cannot use 'multicall binary with symlinks'. The multicall binary checks
  # the symlink filename, so the symlinks cannot have the `uu-` prefix.
  make \
    DESTDIR="$pkgdir" \
    BINDIR="/usr/bin" \
    SBINDIR="/usr/bin" \
    install

  for path in "$pkgdir/usr/bin"/*; do
    dir=$(dirname "$path")
    basename=$(basename "$path")
    mv "$dir/$basename" "$dir/uu-$basename"
  done

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-shadow"
}
