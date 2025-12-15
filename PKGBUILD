# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='rkik'
pkgname="$_pkgname-git"
pkgver=2.0.0.r0.ge5249f1
pkgrel=2
pkgdesc='Rusty Klock Inspection Kit: simple NTP/NTS client (development version)'
arch=('aarch64' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
url='https://github.com/aguacero7/rkik'
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')
options=('!lto')

prepare() {
  cd "$_pkgname"

  git clean -dfx
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
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md docs/{developer,user}_guide.md docs/NTS_USAGE.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir/" && ln -vsrf "$pkgname" "$_pkgname"
  done
}

# eof
