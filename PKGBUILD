# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Roman G <drakosha@au.ru>

pkgname=torrentinfo
pkgver=r264.0e85bcd
pkgrel=1

pkgdesc="Bittorrent .torrent file parser and summariser"
arch=('any')
# url="https://github.com/Fuuzetsu/torrentinfo"
url="https://fuuzetsu.co.uk/torrentinfo/"
license=("GPL-2.0-only")

depends=(python)
makedepends=(git python-build python-installer python-setuptools python-wheel)
source=("git+https://github.com/Fuuzetsu/torrentinfo")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd $pkgname
	sed -i "s/os.name is/os.name ==/g" setup.py # fix warning
}

build() {
	cd $pkgname
	python -m build --wheel --no-isolation
}

package() {
	cd $pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Install LICENSE file
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
