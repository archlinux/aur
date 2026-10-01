# Maintainer: Cynthia Rey <cynthia+aur@cynthia.dev>
# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

_pkgname=upm
pkgname=upm-git
pkgver=1.4.0.r0.g2c98bb4
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
conflicts=(upm upm-bin)
provides=(upm upm-bin)
license=('MIT')

source=("git+https://github.com/unjs/upm.git")
b2sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	node upm install
}

build() {
	cd "$srcdir/$_pkgname"
	node upm build
}

package() {
	local moddir=/usr/lib/node_modules/$_pkgname

	install -dm755 "$pkgdir/usr/bin"
	ln -s "$moddir/dist/$_pkgname.mjs" "$pkgdir/usr/bin/$_pkgname"
	ln -s "$moddir/dist/upx.mjs" "$pkgdir/usr/bin/upx"

	install -dm755 "$pkgdir/$moddir"
	cp -r "$srcdir/$_pkgname/package.json" "$srcdir/$_pkgname/dist" "$pkgdir/$moddir"

	install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
