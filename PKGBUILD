# Maintainer: Peter Jung <ptr1337@cachyos.org>
# Maintainer: asyync1024 <asyync1024 at proton dot me>

_reponame=mold
pkgname=${_reponame}-git
pkgver=2.42.1.r602.g9e320c40
pkgrel=1
pkgdesc='A Modern Linker in Rust'
arch=('x86_64')
url="https://github.com/rui314/$_reponame"
license=('MIT')
# bundled: xxhash, mimalloc, libblake3
depends=(
  glibc
  libgcc
  zlib
  zstd
)
makedepends=(
  cargo
  git
)
source=("git+${url}.git")
b2sums=('SKIP')
provides=("$_reponame=$pkgver")
conflicts=("$_reponame")
options=(!lto)

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_reponame"
  # Fix missing FULL RELRO on mold-wrapper.so
  sed -i '/command.arg("-ldl")/ s/arg.*/args(["-ldl", "-Wl,-z,relro,-z,now"]);/' build.rs

  cargo fetch --locked --target host-tuple
}

build() {
  cd "$_reponame"
  # Option(s) below are used by both build() and check()
  export ZSTD_SYS_USE_PKG_CONFIG=1

  cargo build --release --frozen --package mold-cli
}

check() {
  cd "$_reponame"
  cargo test --frozen
}

package() {
  PREFIX="$pkgdir/usr" "$_reponame/install-mold.sh"
  mv "$pkgdir/usr/libexec/$_reponame/ld" "$pkgdir/usr/lib/$_reponame/"
  rm -rf "$pkgdir/usr/libexec"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_reponame/LICENSE"
}
# vim: ts=2 sw=2 et:
