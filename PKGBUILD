#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0 && updpkgsums && exec makepkg --printsrcinfo > .SRCINFO'
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
# Update this package by:
#
# ```sh
# sudo pacman -S nvchecker jq pacman-contrib
# ./PKGBUILD
# ```
pkgname=cpp-pinyin
pkgver=1.0.0
pkgrel=1
pkgdesc="a lightweight Chinese/Cantonese to Pinyin library"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/wolfgitpr/$pkgname
license=(Apache-2.0)
makedepends=(cmake ninja)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('abfeeac54288e15bc24af020512f13e82a4b933b82b371cc8eea00ceb4b2d2b2')

prepare() {
	cd "$pkgname-$pkgver" || return 1

	cmake -Bbuild -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCPP_PINYIN_BUILD_STATIC=OFF -DCPP_PINYIN_BUILD_TESTS=OFF
}

build() {
	cd "$pkgname-$pkgver" || return 1

	cmake --build build
}

package() {
	cd "$pkgname-$pkgver" || return 1

	DESTDIR="$pkgdir" cmake --install build
}
# ex: nowrap
