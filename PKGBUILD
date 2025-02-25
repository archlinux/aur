# Maintainer: Morbius <archlinux@seichter.de>
# vim: ft=bash ts=4 sw=4 noet
# shellcheck shell=bash disable=2034

pkgname="stown"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Manage file system object mapping via symlinks. Lightweight alternative to GNU Stow."
arch=("any")
depends=("python")
license=("GPL-3.0-or-later")
makedepends=("python-build" "python-installer" "python-wheel")
sha256sums=('87f61f5e7cb2370185c432ac9b1ea92fd686e376df4a4b1b4b1c92cc0de6bf1f'
	'278914f9d7d4a7607fd160007f91e284324051f83dd704bbb3ccd81d8b64ede1')
MYNAME="$pkgname-$pkgver"
source=(
	"https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$MYNAME.tar.gz"
	"$MYNAME.patch"
)
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
		env PYTHONPATH=.:src python -m unittest discover -v tests/ || return 1
}

# shellcheck disable=SC2154
package() {
	cd "$MYNAME" &&
		python -m installer --destdir="$pkgdir" dist/*.whl || return 1
	local doc
	for doc in README*; do
		install -D -m 0644 "$doc" "$pkgdir/usr/share/doc/$pkgname/$(basename "$doc")"
	done
}
