# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='rapidtables'
pkgname="python-$_projectname"
pkgver='0.1.11'
_commit='da2737da6c210518e3044782d72de031c53d9a7e'
pkgrel='7'
pkgdesc='Super fast list of dicts to pre-formatted tables conversion library'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
checkdepends=('python-termcolor')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
	"$pkgname-$pkgver-pep518.diff::$url/commit/4eb2b2878129e0420ca86798cfd0111392bb46dc.diff"
)
b2sums=('b198b723f24884cae5a303171f880c29410e72e25a3431ddfbb2992d39a5aafbed9f8a7ed5fd923f6793da7cff37426410f87cb98fc033d9a27dd56858ec3e8a'
        'a48314c9924c9955016fd544f5b5367d10dece4c51674f6bf77d5dec6dec055b046cdfb1b42daa752ce1a2f12de23e373152bf0869053b27f04b5d6fbcde83a2')

_sourcedirectory="$_projectname-$_commit"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Migrate to a PEP518-based workflow
	patch --forward -p1 < "../$pkgname-$pkgver-pep518.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	_checkoutput="$(python -B 'examples/example.py')"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q '^John     2000  DevOps'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
