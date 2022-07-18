# Maintainer: Erik Bročko (OM2LT) <erik@brocko.eu>

pkgname=python-csdr-git
pkgver=0.18.0.r1.gaaf1928
pkgrel=1
pkgdesc="Python bindings for the csdr library."
arch=('x86_64')
url="https://github.com/jketterl/pycsdr"
license=('GPL3')
depends=()
makedepends=('git' 'python-setuptools' 'csdr')
conflicts=('python-csdr')
provides=('python-csdr')
source=("$pkgname"::'git+https://github.com/jketterl/pycsdr')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	# use git tag or fall back to number of revisions
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build -b ../build -t ../build-tmp
}

package() {
	cd "$srcdir/$pkgname"
	# Sadly, setuptools still don't support separate build directory: https://github.com/pypa/setuptools/issues/1347
	python setup.py build -b ../build -t ../build-tmp install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
}
