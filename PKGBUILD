# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount-git
_pkgname="${pkgname%-git}"
pkgver=0.13.0.r18.g8e6296c
pkgrel=2
epoch=1
pkgdesc="Mount tar files via fusepy. Supports Recursive Mounting, Compressed Files, Read-Only Bind Mounting, Union Mounting and Write Overlays. A fast random access alternative to archivemount."
arch=('any')
url="https://github.com/mxmlnkn/$_pkgname"
license=('MIT')
depends=(
	'python>=3.11'
	'python-fusepy'
	'python-msgpack'
	'python-rapidjson'
	'python-ujson'
	'python-simplejson'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
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
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+$url")
b2sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
	cd "$srcdir/$_pkgname/core"
	python -m build --wheel --no-isolation
	cd "$srcdir/$_pkgname"
	python -m build --wheel --no-isolation
}


package() {
	cd "$srcdir/$_pkgname/core"
	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
	cd "$srcdir/$_pkgname"
	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
	install -Dm755 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
