# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=nfp-git
pkgdesc='Run user-defined actions on new files in watched directories (development version)'
pkgver=r63.g3cc9748
pkgrel=1
url='https://codeberg.org/isagalaev/nfp'
arch=(aarch64 x86_64)
license=(BSD-3-Clause)  # SPDX-License-Identifier: BSD-3-Clause
makedepends=(cargo git)
depends=(libgcc_s.so)
provides=(nfp)
conflicts=(nfp)
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$pkgname"

  # https://wiki.archlinux.org/title/Rust_package_guidelines
  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/nfp
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof
