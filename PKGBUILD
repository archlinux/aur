# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-http'
pkgname="python-$_packagename"
pkgver='1.11.8'
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
b2sums=('69ea0b78ce2877b834f0fbbccba3a61a1c760a55f8bdf6a9b52409d740b216a8b84c13a1541fb2923e6d1922a11ede2c00359a2f3d289265f3c40b92bd142752'
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
