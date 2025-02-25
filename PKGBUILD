# Maintainer: Morbius <archlinux@seichter.de>
# vim: ft=bash ts=4 sw=4 noet
# shellcheck shell=bash disable=2034

pkgname="stown"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Manage file system object mapping via symlinks. Lightweight alternative to GNU Stow."
arch=("any")
depends=("python")
documentation="https://www.seichter.de/stown/"
license=("GPL3")
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
url="https://github.com/rseichter/stown"

build() {
	cd "$pkgname-$pkgver" || return 1
	python -m build --wheel
}

check() {
	cd "$pkgname-$pkgver" || return 1
	env PYTHONPATH=.:src python -m unittest discover -v tests/
}

# shellcheck disable=SC2154
package() {
	cd "$pkgname-$pkgver" || return 1
	python -m installer --destdir="$pkgdir" dist/*.whl
	local doc
	for doc in README* docs/*.{html,pdf}; do
		install -D -m 0644 "$doc" "$pkgdir/usr/share/doc/$pkgname/$(basename "$doc")"
	done
}
