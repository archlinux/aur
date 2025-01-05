# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
_projectname='msgraph-sdk-python-core'
_pkgname='python-msgraph-core'
pkgname="${_pkgname}0.2"
pkgver='0.2.2'
pkgrel='1'
pkgdesc='Core component of the Microsoft Graph Python SDK consisting of HTTP/Graph Client and a configurable middleware pipeline (legacy 0.2.* version)'
arch=('any')
url="https://github.com/microsoftgraph/$_projectname"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('python>=3.5.0' 'python-requests>=2.23.0')
makedepends=('python-build' 'python-flit-core>=2.0.0' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-responses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('c62935f4432cf25101c7d48934d85687a084f7e3a2a24532ee56e6cbce5b25b6da41685b1e3686fbe6db67303e5a5584425e725c6469943ddd493e3cff96b2b4')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run tests, but ignore integration tests, as they require credentials
	pytest --ignore=tests/integration/
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
