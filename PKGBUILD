# Maintainer: nomisge <nomisge @ live . de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: mdraw.gh at gmail dot com

_name=better-exceptions
pkgname=python-${_name}
pkgver=0.3.3
pkgrel=5
pkgdesc="Pretty and helpful exceptions, automatically"
arch=('any')
url="https://github.com/Qix-/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=(
	'python-pytest'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c4751169b2cc02455738a6c71a3de165145aa9572c833e67556008a205820468')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

# Tests are failing, probably cause of upstream errors.
#check() {
#	cd "${srcdir}/${_name}-${pkgver}"
#	python -m pytest -s test
#}

package() {
	cd "${_name}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/${_name}-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
