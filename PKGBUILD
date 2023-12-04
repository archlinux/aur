#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
pkgname=nixd
pkgver=1.2.2
pkgrel=1
pkgdesc="Nix language server, based on nix libraries"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/nix-community/$pkgname
license=(LGPL3)
depends=(libbacktrace nix boost-libs llvm)
makedepends=(meson pkg-config bison flex libbacktrace nix gtest boost llvm)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=(SKIP)

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
