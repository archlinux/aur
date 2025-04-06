# Maintainer: Morbius <archlinux@seichter.de>
# vim: ft=bash ts=4 sw=4 noet
# shellcheck shell=bash disable=2034

pkgname="letsdns"
pkgver="1.2.1"
pkgrel=1
pkgdesc="Manage DANE TLSA records in DNS servers"
arch=("any")
depends=(
	python
	python-cryptography
	python-dnspython
	python-requests
)
makedepends=(
	python-build
	python-installer
	python-wheel
)
license=("GPL-3.0-only")
MYNAME="$pkgname-$pkgver"
source=("$MYNAME.tar.gz::https://github.com/LetsDNS/letsdns/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e974f77d7088f76a5e3149ed7d1e5149abddd601411490027bc7b3f2cb2ea9bb')
url="https://www.letsdns.de/"

build() {
	cd "$MYNAME" &&
		python -m build --wheel || return 1
}

check() {
	# Some tests require private upstream certs, so run only a subset.
	local t=(
		tests/test_config.py
		tests/test_hetzner.py
		tests/test_tlsa.py
		tests/test_util.py
	)
	cd "$MYNAME" &&
		env UNITTEST_CONF=tests/citest.conf python -m unittest "${t[@]}" || return 1
}

# shellcheck disable=SC2154
package() {
	cd "$MYNAME" &&
		python -m installer --destdir="$pkgdir" dist/*.whl || return 1
	install -D -m 0644 README.md "$pkgdir/usr/share/doc/$pkgname/$(basename README.md)"
}
