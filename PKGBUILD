#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0 && updpkgsums && exec makepkg --printsrcinfo > .SRCINFO'
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Lotte V
pkgname=wolf-midi
conflicts=($pkgname)
pkgver=1.0.1
pkgrel=1
pkgdesc="A lightweight library for parsing MIDI"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/wolfgitpr/$pkgname
license=(Apache-2.0)
makedepends=(cmake ninja)
source=("$pkgname-$pkgver.tar.gz::https://github.com/wolfgitpr/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('6359707d2631bd2e6e3f2e34b6ca1da3718a312c09968323b1598e83085beae8417d0c8d465ce50550af6843c9c5f060f799ef6d5a78a013a08cfbaa84506cff')

prepare() {
	cd "$pkgname-$pkgver" || return 1

	cmake -Bbuild -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DWOLF_MIDI_BUILD_STATIC=OFF -DWOLF_MIDI_BUILD_TESTS=OFF
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
