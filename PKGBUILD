# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=lorax
pkgver=36.3_1
pkgrel=1
pkgdesc="Set of tools for creating bootable images"
arch=('any')
url="https://github.com/weldr/lorax"
license=('GPL')
depends=('python-mako')
makedepends=('git' 'python-setuptools')
backup=('etc/lorax/lorax.conf')
changelog=
source=("$pkgname::git+$url#tag=lorax-${pkgver/_/-}?signed")
sha256sums=('SKIP')
validpgpkeys=('B4C6B451E4FA8B4232CA191E117E8C168EFE3A7F') ## Brian C. Lane

prepare() {
	cd "$pkgname"
	sed -i '/data_files.append/s|/usr/sbin|/usr/bin|' setup.py
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	find docs/man \
		-type f \
		-name '*.1' \
		-exec install -Dm644 -t "$pkgdir/usr/share/man/man1/" '{}' \+
}
