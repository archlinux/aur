# Maintainer: Lance Roy <ldr709@gmail.com>

pkgname=python-claripy-git
pkgdesc="An abstraction layer for constraint solvers."
url="https://github.com/angr/claripy"
pkgver=8.20.7.27.r2075.d04d9177
pkgrel=1
arch=('any')
depends=('python' 'python-cachetools' 'python-future' 'python-z3-solver')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('BSD')
source=("$pkgname::git+https://github.com/angr/claripy.git#branch=master")
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
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
