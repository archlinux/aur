# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount
pkgver=0.13.0
pkgrel=4
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
b2sums=('8074e44c1575cd3a8c8488747e0dad0edef124d1fb745b0a7045a7fde89583003fb7afa56b3bf90e3bef28dbab9dc6f79a0429a237be0eddc5ed8ef9026023fe')

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
