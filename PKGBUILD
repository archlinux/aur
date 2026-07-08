# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-serialization-json'
pkgname="python-$_packagename"
pkgver='1.11.7'
pkgrel='1'
pkgdesc='Microsoft Kiota Serialization library for JSON'
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
b2sums=('ad058fdeb8f97d46607ccde9676b8895a15db1eceda8faf644f841a1f9a4cca78d640fc11a3d4b19ef7c4cf039f69055d02d1519296c7b7261ebc9a6320c2a85'
        '96b1fa7b750e331a124328ab854606363709e2bca6b40177be6ec7ce6b071dbf1052023ef4340eed44162c85af227b9477d065afe721ded878b513731042d01f'
        '30ac7b60a22dba9c322790124cfc90354351a827fc49140fbf4589ba2b4767819b0fc1a45f14dc40858ec1271ead3807d1c443ce64b9fca9690debaf15c39269')

_sourcedirectory="$_projectname-$_packagename-v$pkgver/packages/serialization/json"

prepare() {
	cd "$srcdir/$_sourcedirectory/../../../"

	# Bump flit upper bound, as there were no BCs
	patch --forward -p1 < "$srcdir/change-flit-upper-bound.diff"

	# Hardcode package version in _version.py to enable us to run tests without installing the package
	patch --forward -p1 < "$srcdir/hardcode-version.diff"
	sed -i "s|%%PKGVER%%|$pkgver|g" "$srcdir/$_sourcedirectory/kiota_serialization_json/_version.py"
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
