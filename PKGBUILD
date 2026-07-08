# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-http'
pkgname="python-$_packagename"
pkgver='1.11.7'
pkgrel='1'
pkgdesc='Microsoft Kiota HTTP library'
arch=('any')
url="https://github.com/microsoft/$_projectname"
license=('MIT')
depends=('python>=3.10.0' 'python-h2' 'python-httpx>=0.25.0' 'python-microsoft-kiota-abstractions>=1.11.1' 'python-opentelemetry-api>=1.27.0' 'python-opentelemetry-sdk>=1.27.0')
makedepends=('python-build' 'python-flit-core>=3.2.0' 'python-installer' 'python-wheel')
checkdepends=('python-pytest>=9.1.1' 'python-pytest-asyncio>=1.4.0' 'python-pytest-mock')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_packagename-v$pkgver.tar.gz"
	'change-flit-upper-bound.diff'
	'hardcode-version.diff'
)
b2sums=('19552779d0efa7ed7621275a9fcf78baef837e5666859e6d8c57da670f8d445e9cb51980522c38f28f7ebd5303249f381e1f50ef5e6d6465503330fb146aba37'
        '448cb419f23a69d708f6b7fd809ee368cc8e99533657e9dc0371d0ee608bf0d98158629f5db87a3d03b27ccd249597aad44a5c852ee0fd8e184158f0a9450542'
        '08deb41334a3dcc512ed36ce5fa72f0343288158e235dca230c51a3463faf2c292504b86bc108a8c9bea92f68e069e8a71e8428831730be0a96e3e3615bb9919')

_sourcedirectory="$_projectname-$_packagename-v$pkgver/packages/http/httpx"

prepare() {
	cd "$srcdir/$_sourcedirectory/../../../"

	# Bump flit upper bound, as there were no BCs
	patch --forward -p1 < "$srcdir/change-flit-upper-bound.diff"

	# Hardcode package version in _version.py to enable us to run tests without installing the package
	patch --forward -p1 < "$srcdir/hardcode-version.diff"
	sed -i "s|%%PKGVER%%|$pkgver|g" "$srcdir/$_sourcedirectory/kiota_http/_version.py"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
