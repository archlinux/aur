# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='neotermcolor'
pkgname="python-$_projectname"
pkgver='2.0.10'
_commit='f4993d2590a2bfe6d89d075a38ede39e7dd0b896'
pkgrel='5'
pkgdesc='Modern ANSII Color formatting for output in terminal'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
	"$pkgname-$pkgver-pep518.diff::$url/commit/b687398941ad8d5f14020a63fb9b7c2da2ad4f35.diff"
)
b2sums=('5b8804f47783cdf7d8d5729fab3f4e5c5b99b64a7395b708ca0c4a1aadc477b334c18cf174203afddca9e5d2166e0337c0723178f7dd64e50f3ee37cb1d22d21'
        'f90449f287f64bad166c926451ab5862b786079312db49faedc8a10fe8afec0d4d653f2baf727889367abf68a3957a2619a4a7d95428a9c17b7a732ec3ed1ceb')

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
	python test.py
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
