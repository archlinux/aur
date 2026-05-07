#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0 && updpkgsums && exec makepkg --printsrcinfo > .SRCINFO'
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Lotte V
pkgname=cpp-kana
conflicts=($pkgname)
pkgver=1.0.2
pkgrel=1
pkgdesc="A lightweight library for converting Japanese kana to romaji and vice versa."
arch=(i686 x86_64 arm aarch64)
url=https://github.com/wolfgitpr/$pkgname
license=(Apache-2.0)
makedepends=(cmake ninja)
source=("$pkgname-$pkgver.tar.gz::https://github.com/wolfgitpr/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('7fab4134c2caca4229fc6b459df10c92ad4385e3e724d9dc0cd3346d15b9862df3ebe99b0a345b9f468866d03b2d0c0c8f0f3e126e797a5e61e3179c317ba3d5')

prepare() {
	cd "$pkgname-$pkgver" || return 1

	cmake -Bbuild -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCPP_KANA_BUILD_STATIC=OFF -DCPP_KANA_BUILD_TESTS=OFF
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
