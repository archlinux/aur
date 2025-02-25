# Maintainer: Morbius <archlinux@seichter.de>
# vim: ft=bash ts=4 sw=4 noet
# shellcheck shell=bash disable=2034

pkgname="stown"
pkgver="1.0.0"
pkgrel=4
pkgdesc="Manage file system object mapping via symlinks. Lightweight alternative to GNU Stow."
arch=("any")
depends=("python")
license=("GPL-3.0-or-later")
makedepends=("python-build" "python-installer" "python-wheel")
MYNAME="$pkgname-$pkgver"
source=("https://github.com/rseichter/stown/archive/refs/tags/$pkgver.tar.gz" "$MYNAME.patch")
sha256sums=('744861b241d7984a42c37c1fca578788cdb0f8110fa7625a4774cc24f076d0ad'
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
