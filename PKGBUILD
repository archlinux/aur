# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: b10n <b10n@dittes.nl>

pkgname=powermate-git
_pkgname=powermate-linux
pkgver=8.r0.ga5aed40
pkgrel=1
pkgdesc='A small Linux userspace driver for the Griffin PowerMate'
arch=(x86_64)
url="https://github.com/stefansundin/$_pkgname"
license=(GPL3)
depends=(libpulse)
makedepends=(git)
source=("git+$url.git"
		'git+https://github.com/cktan/tomlc99.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
	cd "$_pkgname"
	git submodule init
	git config submodule.tomlc99.url "$srcdir/tomlc99"
	git -c protocol.file.allow=always submodule update
}

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" powermate
	install -Dm0644 -t "$pkgdir/etc/udev/rules.d/" 60-powermate.rules
}
