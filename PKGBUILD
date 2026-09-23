# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-serialization-multipart'
pkgname="python-$_packagename"
pkgver='1.14.0'
pkgrel='1'
pkgdesc='Microsoft Kiota Multipart Serialization Library for Python'
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
b2sums=('3290c4cfab93c3f5ea0efdb76c8d344a00406d56bf5034137fecdd49c51fd64e718f0ebe0cd9252fed940d1ab5a211c8e7f919eb52af854fb3369faa032fe4b6'
        'aafb76f10a98b0b29c49d710874136edeccc088f373053430abce71c9d31d810bc3161282bb739f96521e2b3bd1c852504da6efc3af03110662a617b87384bdb')

_sourcedirectory="$_projectname-$_packagename-v$pkgver/packages/serialization/multipart"

prepare() {
	cd "$srcdir/$_sourcedirectory/../../../"

	# Hardcode package version in _version.py to enable us to run tests without installing the package
	patch --forward -p1 < "$srcdir/hardcode-version.diff"
	sed -i "s|%%PKGVER%%|$pkgver|g" "$srcdir/$_sourcedirectory/kiota_serialization_multipart/_version.py"
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
