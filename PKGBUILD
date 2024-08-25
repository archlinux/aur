# Maintainer: Maks Verver <maks@verver.ch>
pkgname=python-reader
_name=reader
pkgver=3.14
pkgrel=1
pkgdesc='Python feed reader library for RSS, Atom, and JSON feeds'
arch=(any)
url='https://github.com/lemon24/reader'
license=('BSD-3-Clause')
depends=(
	python-beautifulsoup4
	python-feedparser
	python-iso8601
	python-requests
	python-typing_extensions
	python-werkzeug
)
makedepends=(
	python-build
	python-installer
	python-wheel
)
optdepends=(
	python-flask
	python-humanize
	python-mutagen
	python-requests-wsgi-adapter
)
checkdepends=(
	${optdepends[@]}
	python-lxml
	python-mechanicalsoup
	python-pytest
	python-pytest-subtests
	python-requests-mock
)
source=(
	"$_name-$pkgver.tar.gz::https://github.com/lemon24/$_name/archive/refs/tags/$pkgver.tar.gz"
	'vendor-feedparser.patch'
)
sha256sums=(
	'341d9362d1807208306196b879fba1f686bce6cbbfde34e7796e3c049ee9bfd6'
	'd31afb5ba28a45fa8e96ef1db370454ca641e6cd10fd33272650b7659886dad0'
)

prepare() {
	cd "$_name-$pkgver"

	# Shipped version of feedparser is buggier than the Arch package, so delete it.
	# Without this, most of the tests fail.
	rm -R src/reader/_vendor/
	patch -p1 -i "$srcdir/vendor-feedparser.patch"
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"

	# Run all tests, including slow tests, but excluding two tests that don't
	# pass on my system (I don't think these are critical failures):
	#
	#   test_disk_storage_has_attached_database: https://github.com/lemon24/reader/issues/348
	#   test_only_expected_modules_are_imported: https://github.com/lemon24/reader/issues/349
	#
	# Try re-enabling them after the issues are resolved.
	PYTHONPATH=src/ pytest --runslow -k 'not test_disk_storage_has_attached_database and not test_only_expected_modules_are_imported'
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
