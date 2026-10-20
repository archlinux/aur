# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=upm
pkgver=1.5.0
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
b2sums=('0ad5ff4fdf04d95f22f02e3b41916bb10cecc5aad439ea6eecc029a476c2ee683d48975695042b549ba3bddae8efaeca43b6d5801039676a5b30667a48ae0f8c')

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
