# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount
pkgver=0.15.1
pkgrel=1
pkgdesc="Mount tar files via fusepy. Supports Recursive Mounting, Compressed Files, Read-Only Bind Mounting, Union Mounting and Write Overlays. A fast random access alternative to archivemount."
arch=(any)
url="https://github.com/mxmlnkn/$pkgname"
conflict=("${_pkgname}-git")
license=('MIT')
depends=(
	'python>=3.11'
	'python-msgpack'
	'python-rapidjson'
	'python-ujson'
	'python-simplejson'
	'python-fusepy'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
optdepends=(
	'pragzip: Option 1 for support for gzip-compressed tar files'
	'python-indexed-gzip: Option 2 for support for gzip-compressed tar files'
	'python-indexed-zstd: Support for zstd-compressed tar files'
	'python-indexed-bzip2: Support for bzip2-compressed tar files'
	'python-rarfile: Support for rar-compressed tar files'
	'lzmaffi: Option 1 for support for xz-compressed tar files'
	'python-xz: Option 2 for support for xz-compressed tar files' 
)
_pkg_ext='.tar.gz'
source=("${pkgname}-${pkgver}${_pkg_ext}::${url}/archive/refs/tags/v${pkgver}${_pkg_ext}")
b2sums=('516253edbd22904af78e519bb66323c008fee013c293f7755bb935da0daa9dae165b01f316655308ee9af99c9538b9b5c3c6e4ae623ae864e74c31efa2a9599d')

build() {
	cd "$srcdir/${pkgname}-${pkgver}/core"
	python -m build --wheel --no-isolation
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}/core"
	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl	
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
	install -Dm755 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
