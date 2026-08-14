# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-serialization-form'
pkgname="python-$_packagename"
pkgver='1.11.8'
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
b2sums=('16df034262f8c730b1907d6a93f83c7ea5a8d279987a05244a79b0fd87cb34e59e4f404a1102af3c61c2cf0babbafc279de933faf53fdb5da840ec2c75cff840'
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
