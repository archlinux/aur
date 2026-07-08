# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-serialization-text'
pkgname="python-$_packagename"
pkgver='1.11.7'
pkgrel='1'
pkgdesc='Microsoft Kiota Text Serialization library'
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
b2sums=('ccb8793c500c8dc5901f93542c69fbdb15de7dac116ee9ae84c52374e0f0d6f88047213c27e72fef75e1a6ef42ac325d621ada719c0c551ec66d5e966939169d'
        'e20e9f40b37ea3793af4ee61572499b9f17a5a3e14b353817633ac4f82afa9b4aa68ab302352e9830fd868d88c8600e185c23ab749cd2672ef11f1b0160e05f9'
        '713f73357aca8fc2696a658796db14a6c4dd548de0a81136ad9d2758d04133b5a9f65e2afb0ca029962dae7baa88057fb1446d55693d496e2f9b4fd3710ef2c8')

_sourcedirectory="$_projectname-$_packagename-v$pkgver/packages/serialization/text"

prepare() {
	cd "$srcdir/$_sourcedirectory/../../../"

	# Bump flit upper bound, as there were no BCs
	patch --forward -p1 < "$srcdir/change-flit-upper-bound.diff"

	# Hardcode package version in _version.py to enable us to run tests without installing the package
	patch --forward -p1 < "$srcdir/hardcode-version.diff"
	sed -i "s|%%PKGVER%%|$pkgver|g" "$srcdir/$_sourcedirectory/kiota_serialization_text/_version.py"
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
