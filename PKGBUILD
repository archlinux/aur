# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-http'
pkgname="python-$_packagename"
pkgver='1.14.0'
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
	'hardcode-version.diff'
)
b2sums=('28aec1608985b7f58eb425e753aaf186179ef8bf3fd0b434588adf5d1e92a790667b130d511b5a6e62ad1157e9a388449c8adaac8b99b93764e698a3e9d6f992'
        '08deb41334a3dcc512ed36ce5fa72f0343288158e235dca230c51a3463faf2c292504b86bc108a8c9bea92f68e069e8a71e8428831730be0a96e3e3615bb9919')

_sourcedirectory="$_projectname-$_packagename-v$pkgver/packages/http/httpx"

prepare() {
	cd "$srcdir/$_sourcedirectory/../../../"

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
