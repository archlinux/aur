# Maintainer: RubenKelevra <cyrond@gmail.com>
# Contributor: jerry73204 <jerry73204 at gmail dot com>

pkgname=ogr2osm-git
pkgver=r371.f7d2f33
pkgrel=2
epoch=2
pkgdesc='A tool for converting ogr-readable files like shapefiles into .osm data'
arch=('any')
url='https://github.com/roelderickx/ogr2osm'
license=('MIT')
depends=(
	'python>=3.11'
	gdal
	'python-gdal>=3.0.0'
	'python-lxml>=4.3.0'
	python-protobuf
	protobuf
)
makedepends=(
	git
	python-build
	python-installer
	python-wheel
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"ogr2osm::git+$url"
	'https://raw.githubusercontent.com/roelderickx/ogr2osm/main/LICENSE'
)
b2sums=('SKIP'
        '5003f6697eb36d2709c69ad8d1c81ae258a94e6fa5319075198caf3b7fe84a0671b9c12f0848c6dd03a520371d43f444232696feb28379465dabf12463cd09b2')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}
