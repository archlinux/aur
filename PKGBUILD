# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Francois Boulogne <fboulogne at april dot org>

## GPG key: https://github.com/tacaswell.gpg

pkgname=python-slicerator
pkgver=1.1.0
pkgrel=1
pkgdesc="A lazy-loading, fancy-sliceable iterable"
url="https://github.com/soft-matter/slicerator"
arch=('any')
license=('BSD')
depends=('python')
makedepends=(
	'git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-numpy')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('96B7334D7610EE3E68AFFE589E027116943D6A8B') ## Thomas A. Caswell

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/slicerator-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
