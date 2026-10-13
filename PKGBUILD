# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-shadow
pkgver=0.6.0
pkgrel=1
pkgdesc="A memory-safe reimplementation of the Linux shadow-utils in Rust"
arch=('i686' 'x86_64')
url="https://github.com/uutils/shadow"
license=('MIT')
depends=('glibc' 'libgcc' 'libxcrypt' 'pam')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/shadow/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8f7946cc4ee0709d0946a8f5dea65c4b691b214ee2d5bf5d02822153d13787fc')


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
