# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='msgraph-sdk-python'
pkgname="python-msgraph-sdk"
pkgver='1.60.0'
pkgrel='1'
pkgdesc='Microsoft Graph SDK for Python'
arch=('any')
url="https://github.com/microsoftgraph/$_projectname"
license=('MIT')
depends=('python>=3.10.0' 'python-azure-identity>=1.12.0' 'python-msgraph-core>=1.5.1' 'python-microsoft-kiota-serialization-form>=1.8.0' 'python-microsoft-kiota-serialization-json>=1.8.0' 'python-microsoft-kiota-serialization-multipart>=1.8.0' 'python-microsoft-kiota-serialization-text>=1.8.0')
makedepends=('python-build' 'python-flit-core>=3.2.0' 'python-installer' 'python-wheel')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'change-flit-upper-bound.diff'
)
b2sums=('42851aa6322a48068375e6c413cc2fb6e8f577034447e5c85eaf2e9bf55ca22ec99bfc3259292ce2cc8c8340fe483f6393d73763a40bb1afc9fe9bd87f5f8499'
        '3f4d78627dbed959fee712fad349da2c2e41bb3b37c3c8fb564b65ada5892758dc607d0028392131fa33d29385bc107f9be5e6ed0ce5484c685d1d109e4d01c7')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Bump flit upper bound, as there were no BCs
	patch --forward -p1 < '../change-flit-upper-bound.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
