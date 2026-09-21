# Maintainer: Peter Jung <ptr1337@cachyos.org>
# Maintainer: asyync1024 <asyync1024 at proton dot me>

_reponame=mold
pkgname=${_reponame}-git
pkgver=2.42.1.r466.g99d79c42
pkgrel=2
pkgdesc='A Modern Linker'
arch=('x86_64')
url="https://github.com/rui314/$_reponame"
license=('MIT')
# bundled: xxhash, mimalloc, zstd, libblake3
depends=(
  glibc
  libgcc
  zlib
)
makedepends=(
  cargo
  git
  mold
)
source=("git+${url}.git")
b2sums=('SKIP')
provides=("$_reponame=$pkgver")
conflicts=("$_reponame")

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # Fix missing FULL RELRO on mold-wrapper.so
  sed -i '/command.arg("-ldl")/ s/arg.*/args(["-ldl", "-Wl,-z,relro,-z,now"]);/' "$_reponame"/build.rs
}

build() {
  cd "$_reponame"
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"
  cargo build --release --locked --package mold-cli
}

check() {
  cd "$_reponame"
  cargo test --locked --package mold-cli
}

package() {
  PREFIX="$pkgdir/usr" "$_reponame/install-mold.sh"
  mv "$pkgdir/usr/libexec/$_reponame/ld" "$pkgdir/usr/lib/$_reponame/"
  rm -rf "$pkgdir/usr/libexec"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_reponame/LICENSE"
}
# vim: ts=2 sw=2 et:
