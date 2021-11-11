# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Wilson Birney <wpbirney@gmail.com>

pkgname=pirate-get-git
pkgver=0.4.0.r5.g608cb0a
pkgrel=1
pkgdesc="Command line interface for The Pirate Bay"
arch=('any')
url="https://github.com/vikstrous/pirate-get"
license=('AGPL3')
depends=(
	'python-pyperclip'
	'python-colorama'
	'python-veryprettytable'
	'python-termcolor')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	sed -i "/packages=/c\packages=['pirate']," setup.py
}

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
	python setup.py test
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
