# Maintainer: Colin Unger <mastakata 3 at yahoo dot com>

pkgname=python-archinfo-git
pkgdesc="Architecture-information specific details for the angr project"
url="https://github.com/angr/archinfo"
pkgver=8.18.10.25.r308.d3eb03b
pkgrel=1
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('BSD')
source=("$pkgname::git+https://github.com/angr/archinfo.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	regex='[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+'
	prefix='ticked version number to'
	rev_num="$(git rev-list --count HEAD)"
	version_no="$(git log -n1 --grep "$prefix $regex" --format=tformat:%s | sed "s/$prefix \($regex\)/\1/g")"
	last_commit="$(git rev-parse --short HEAD)"
	echo "$version_no.r$rev_num.$last_commit"
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
