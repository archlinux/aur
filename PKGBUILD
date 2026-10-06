# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=upm
pkgver=1.4.0
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
b2sums=('54220161ed1364fe6c245a375fb071fdd3d0acea1486fd6c90b4e186380d91333edf1df30894a3083eefecde1e981b588871822ff62268f7d9693f0a9e1a53c9')

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
