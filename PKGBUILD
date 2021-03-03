# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=pysat
pkgname="python-$_pkgname-git"
pkgver=0.1.6.dev6.r16.g58a7658
pkgrel=1
pkgdesc="A toolkit for SAT-based prototyping in Python"
arch=(x86_64)
url="https://github.com/pysathq/pysat"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"

	python setup.py build
}

check() {
	cd "$_pkgname"

	local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

	touch tests/__init__.py
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
