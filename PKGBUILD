# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-serialization-form'
pkgname="python-$_packagename"
pkgver='1.14.0'
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
	'hardcode-version.diff'
)
b2sums=('32ec43ae9093ebde6dd30f4c2ecd60fed285fe040335ad1666173cda68bf94956e8d5236ca6126d158be6571478aff1d354aa135a78e612f866e539e9be4b64a'
        '23424e8b7497a494f14874b78f7ed21116cab7fbd922a5b94c229e6c282e01dc614166e803743770d6a7b7c0d8b0d6459e7a2d5d5b1a465a7cc4bb73c876b918')

_sourcedirectory="$_projectname-$_packagename-v$pkgver/packages/serialization/form"

prepare() {
	cd "$srcdir/$_sourcedirectory/../../../"

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
