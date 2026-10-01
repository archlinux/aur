# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

pkgname=upm
pkgver=1.3.0
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
conflicts=(upm-bin upm-git)
provides=(upm-bin upm-git)
license=('MIT')

source=("git+https://github.com/unjs/upm.git#tag=v$pkgver")
b2sums=('e16db61a781db379d0bc5ab23ddc4f920b54ec86b405ed246719f70726c71d41ea46ef6c13cbfb35eac302a0df91e7b8e4671e58670024f6cc1d634dce00445f')

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
