# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='attempt'
pkgname="$_pkgname-git"
pkgver=1.0.1.r0.gc083e94
pkgrel=1
pkgdesc='CLI tool for retrying fallible commands (development version)'
arch=('aarch64' 'x86_64')
license=('Unlicense')  # SPDX-License-Identifier: Unlicense
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
url='https://github.com/MaxBondABE/attempt'
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"

  #git clean -dfx
}

pkgver() {
  cd "$_pkgname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  cd docs/src && \
  for _dir in *; do
    test -d "$_dir" || continue
    install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/docs/$_dir" "$_dir"/*.md
  done
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/docs" ./*.md
}

# eof
