# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-abstractions'
pkgname="python-$_packagename"
pkgver='1.11.7'
pkgrel='1'
pkgdesc='Microsoft Kiota Abstractions Library for Python'
arch=('any')
url="https://github.com/microsoft/$_projectname"
license=('MIT')
depends=('python>=3.10.0' 'python-opentelemetry-api>=1.27.0' 'python-opentelemetry-sdk>=1.27.0' 'python-std-uritemplate>=2.0.0')
makedepends=('python-build' 'python-flit-core>=3.2.0' 'python-installer' 'python-wheel')
checkdepends=('python-pytest>=9.1.1' 'python-pytest-asyncio>=1.4.0')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_packagename-v$pkgver.tar.gz"
	'change-flit-upper-bound.diff'
	'hardcode-version.diff'
)
b2sums=('a74f966c7b77dd775d0b0ab2424ba7a695d83565da422bd5573951b06e7b32186ba824f6044a35d388d4947fc23ae131b88670c682d64ea16de936be3abefd40'
        '5a4b40bfb5ed4359ac9c22a2c87346dccfb66b7c8233e1d27785d1770ad03e54bbb14b034ba00bd38126679aa4fe20d440cae576215e5e41834cad2d206a5461'
        'ac5084e3f4fc4359850ae2ab2384d87c2110cde1acceb8fdc5b45e9f231bab534601e020c0d5615a3133330d7a10bdd64ef3b8294a7dc2504afab003494beb6f')

_sourcedirectory="$_projectname-$_packagename-v$pkgver/packages/abstractions"

prepare() {
	cd "$srcdir/$_sourcedirectory/../../"

	# Bump flit upper bound, as there were no BCs
	patch --forward -p1 < "$srcdir/change-flit-upper-bound.diff"

	# Hardcode package version in _version.py to enable us to run tests without installing the package
	patch --forward -p1 < "$srcdir/hardcode-version.diff"
	sed -i "s|%%PKGVER%%|$pkgver|g" "$srcdir/$_sourcedirectory/kiota_abstractions/_version.py"
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
