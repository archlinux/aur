# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-serialization-form'
pkgname="python-$_packagename"
pkgver='1.11.7'
pkgrel='1'
pkgdesc='Microsoft Kiota URI Form Encoded Serialization Library for Python'
arch=('any')
url="https://github.com/microsoft/$_projectname"
license=('MIT')
depends=('python>=3.10.0' 'python-microsoft-kiota-abstractions>=1.11.1')
makedepends=('python-build' 'python-flit-core>=3.2.0' 'python-installer' 'python-wheel')
checkdepends=('python-pytest>=9.1.1' 'python-pytest-asyncio>=1.4.0')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_packagename-v$pkgver.tar.gz"
	'change-flit-upper-bound.diff'
	'hardcode-version.diff'
)
b2sums=('b86d262f9e617d252e7d194af3f32bca0dc3fb159d0cbac1ff54ea00986a94e792d91ed495dcefec1c4c32850de20c06a7d9beb34aedb8f3fbcec2c94f046adf'
        'c0b20f675d9ad875c338d1f7d3987047a9543e2e6f04f0601e379091305d34e335b0815e5c1eb905f82610e11a01083e5194611ca60b9ede3d4fa35f53927f9e'
        '23424e8b7497a494f14874b78f7ed21116cab7fbd922a5b94c229e6c282e01dc614166e803743770d6a7b7c0d8b0d6459e7a2d5d5b1a465a7cc4bb73c876b918')

_sourcedirectory="$_projectname-$_packagename-v$pkgver/packages/serialization/form"

prepare() {
	cd "$srcdir/$_sourcedirectory/../../../"

	# Bump flit upper bound, as there were no BCs
	patch --forward -p1 < "$srcdir/change-flit-upper-bound.diff"

	# Hardcode package version in _version.py to enable us to run tests without installing the package
	patch --forward -p1 < "$srcdir/hardcode-version.diff"
	sed -i "s|%%PKGVER%%|$pkgver|g" "$srcdir/$_sourcedirectory/kiota_serialization_form/_version.py"
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
