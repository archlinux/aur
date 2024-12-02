# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=greaseweazle
pkgname="$_pkgbase-git"
pkgver=1.21.r3.gf0d43b7
pkgrel=1
pkgdesc="Tools for accessing a floppy drive at the raw flux level"
arch=('x86_64')
url="https://github.com/keirf/greaseweazle"
license=('Unlicense')
depends=('python' 'python-requests' 'python-pyserial' 'python-bitarray' 'python-crcmod')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/keirf/greaseweazle.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"

	# latest tag is often just "latest", so let's check two last ones
	version=$(git tag --sort=committerdate | tail -2 | grep v[0-9])

	git describe --long --tags --abbrev=7 | sed "s/latest/$version/" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$_pkgbase"

	python setup.py build
}

package() {
	cd "$_pkgbase"

	python setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 scripts/49-greaseweazle.rules "$pkgdir/usr/lib/udev/rules.d/49-greaseweazle.rules"
}
