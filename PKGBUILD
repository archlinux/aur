# Maintainer: Morbius <archlinux@seichter.de>
# vim: ft=bash ts=4 sw=4 noet
# shellcheck shell=bash disable=2034

pkgname="stown"
pkgver="1.2.0"
pkgrel=1
pkgdesc="Manage file system object mapping via symlinks. Lightweight alternative to GNU Stow."
arch=("any")
depends=("python>=3.9")
license=("GPL-3.0-or-later")
makedepends=("python-build" "python-installer" "python-wheel")
MYNAME="$pkgname-$pkgver"
source=("$MYNAME.tar.gz::https://github.com/rseichter/stown/archive/refs/tags/$pkgver.tar.gz" "$MYNAME.patch")
sha256sums=('ae3dac23240cbd92624da20883072891551d41b01145f098f289d44546ff70b6'
	'278914f9d7d4a7607fd160007f91e284324051f83dd704bbb3ccd81d8b64ede1')
url="https://www.seichter.de/stown/"

prepare() {
	cd "$MYNAME" &&
		patch -Np1 -i "../$MYNAME.patch" || return 1
}

build() {
	cd "$MYNAME" &&
		python -m build --wheel || return 1
}

check() {
	cd "$MYNAME" &&
		env PYTHONPATH=.:src python -m unittest discover tests/ || return 1
}

# shellcheck disable=SC2154
package() {
	cd "$MYNAME" &&
		python -m installer --destdir="$pkgdir" dist/*.whl || return 1
	local doc
	for doc in README.md docs/index.html; do
		install -D -m 0644 "$doc" "$pkgdir/usr/share/doc/$pkgname/$(basename "$doc")"
	done
}
