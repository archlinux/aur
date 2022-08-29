# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philipp Joram <mail AT phijor DOT me>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Mohammed Yaseen Mowzer <moyamodehacker@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-axolotl-git
_pkg="${pkgname%-git}"
pkgver=0.2.3.r2.gb8d1a2e
pkgrel=2
pkgdesc="Python port of libaxolotl"
url="https://github.com/tgalal/python-axolotl"
arch=('any')
license=('GPL3')
depends=('python-axolotl-curve25519' 'python-cryptography' 'python-protobuf')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=('python-axolotl')
conflicts=('python-axolotl')
source=("$_pkg::git+$url")
sha512sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkg"
	sed -i '/packages=/s/()/(exclude=["*tests*"])/' setup.py
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg"
	pytest -x
}

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
