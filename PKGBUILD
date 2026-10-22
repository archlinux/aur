# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=upm
pkgver=1.5.1
pkgrel=1
pkgdesc='A fast, tiny package manager for the npm registry, written in TypeScript.'
url='https://github.com/unjs/upm'
arch=('any')
depends=(
	'nodejs>=22.3'
)
makedepends=(
	'git'
)
license=('MIT')

source=("git+https://github.com/unjs/upm.git#tag=v$pkgver")
b2sums=('8ff979f0c2bdb7516480da5876cd3211b3af66f38209142822b0e169ed250c6578449565a560e2c2418817e76fca8300ae2f169db671dc0b3a59c261d7d38e51')

prepare() {
	cd "$srcdir/$pkgname"
	node upm install
}

build() {
	cd "$srcdir/$pkgname"
	node upm build
}

package() {
	local moddir=/usr/lib/node_modules/$pkgname

	install -dm755 "$pkgdir/usr/bin"
	ln -s "$moddir/dist/$pkgname.mjs" "$pkgdir/usr/bin/$pkgname"
	ln -s "$moddir/dist/upx.mjs" "$pkgdir/usr/bin/upx"

	install -dm755 "$pkgdir/$moddir"
	cp -r "$srcdir/$pkgname/package.json" "$srcdir/$pkgname/dist" "$pkgdir/$moddir"

	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
