# Maintainer: Jiuyang Liu <liu@jiuyang.me>

_pkgname=nsncd-codyps
pkgname=nsncd-codyps-git
pkgver=v1.4.2.codyps.1.r5.gb01247c
pkgrel=1
pkgdesc='nscd-compatible daemon without caching. (fork with fixes & socket activation)'
arch=('x86_64')
url='https://github.com/codyps/nsncd'
license=('MIT')
conflicts=('nsncd' 'nsncd-git')
makedepends=('git' 'cargo')
depends=(glibc gcc-libs)
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  #cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"

  # binary
  install -vDm755 -T "target/release/nsncd" "$pkgdir/usr/lib/nsncd"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # systemd
  install -vDm644 -T "nsncd.service" "$pkgdir/usr/lib/systemd/system/nsncd.service"
  install -vDm644 -T "nsncd.socket" "$pkgdir/usr/lib/systemd/system/nsncd.socket"
}
