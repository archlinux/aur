# Maintainer: Maks Verver <maks@verver.ch>
pkgname=python-reader
_name=reader
pkgver=3.14
pkgrel=2
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
	"$pkgname-$pkgver.tar.gz::https://github.com/lemon24/$_name/archive/refs/tags/$pkgver.tar.gz"
	"$pkgname-test_lazy_imports.patch::https://github.com/lemon24/reader/commit/63e8ec34bb6fd7c68a0e2ffa4178634947472d5c.patch"
	"$pkgname-test_disk_storage_has_attached_database.patch::https://github.com/lemon24/reader/pull/351/commits/5f8b2af3b9a319c03eae045aa0e0d6a666bf531e.patch"
	"$pkgname-test_parser_selection.patch"
)
sha256sums=('341d9362d1807208306196b879fba1f686bce6cbbfde34e7796e3c049ee9bfd6'
            'b392238a61a4c2c208d2d7c1319d329c9c0b25149f82736882467aef4466f3ef'
            '6226f8f32a8e8febffa53c01d727303a56ab6d366393c8bc91e7b394b22f223d'
            'f0c61172e2fba35f92c4b3483dd1fef25227690b17009bb57f37b7bdfbccf5df')

prepare() {
	cd "$_name-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-test_lazy_imports.patch"
	patch -p1 -i "$srcdir/$pkgname-test_disk_storage_has_attached_database.patch"
	patch -p1 -i "$srcdir/$pkgname-test_parser_selection.patch"
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"

	# Run all tests, including slow tests.
	# XDG_CONFIG_HOME is set to work around: https://github.com/lemon24/reader/issues/355
	XDG_CONFIG_HOME=/nonexistent PYTHONPATH=src/ pytest --runslow
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
