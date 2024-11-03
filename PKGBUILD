# Maintainer: Snogard <snogardb at gmail dot com>
# Contributor: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount
pkgver=0.15.2
pkgrel=1
pkgdesc="Mount tar files via fusepy. Supports Recursive Mounting, Compressed Files, Read-Only Bind Mounting, Union Mounting and Write Overlays. A fast random access alternative to archivemount."
arch=(any)
url="https://github.com/mxmlnkn/$pkgname"
conflicts=("${pkgname}-git")
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
    'python-rapidgzip: Support for gzip and bzip2 compressed tar files'
    'python-indexed-gzip: Option 2 for support for gzip-compressed tar files'
    'python-xz: Support for xz-compressed tar files'
    'python-indexed-zstd: Support for zstd-compressed tar files'
    'python-rarfile: Support for rar-compressed tar files'
    'python-libarchive-c: Support for 7z, ar, cab, compress, cpio, iso, lrzip, lzma, lz4, lzip, lzo, warc, xar; (no random access)'
)

_pkg_ext='.tar.gz'
source=("${pkgname}-${pkgver}${_pkg_ext}::${url}/archive/refs/tags/v${pkgver}${_pkg_ext}")
b2sums=('ac610468006f99bf528022ecb585ab51f2b0ef48a4b255a1ad8a692703f85890fd9991a8c6c05d938d421fbbd9e9c450d764b2f0b24a84d2a97ff1d40ede5fc9')

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
