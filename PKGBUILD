# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libbz2-rs-sys-git
pkgver=0.2.5.r1.g1028131
pkgrel=1
pkgdesc="An implementation of bzip2 in pure rust available as a C dynamic library"
arch=('i686' 'x86_64')
url="https://github.com/trifectatechfoundation/libbzip2-rs"
license=('bzip2-1.0.6')
makedepends=('git' 'cargo' 'cargo-c')
provides=("libbz2-rs-sys=$pkgver")
conflicts=('libbz2-rs-sys')
options=('staticlibs')
source=("git+https://github.com/trifectatechfoundation/libbzip2-rs.git")
sha256sums=('SKIP')


prepare() {
  cd "libbzip2-rs/libbz2-rs-sys-cdylib"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "libbzip2-rs/libbz2-rs-sys-cdylib"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}


check() {
  cd "libbzip2-rs/libbz2-rs-sys-cdylib"

  #cargo test \
  #  --frozen
}

package() {
  cd "libbzip2-rs/libbz2-rs-sys-cdylib"

  cargo cinstall \
    --locked \
    --destdir "$pkgdir" \
    --prefix "/usr"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libbz2-rs-sys"
}
