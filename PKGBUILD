# Maintainer: Snogard <snogardb at gmail dot com>
# Contributor: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>
# Contributor: Maximilian Knespel <mxmlnknp at gmail dot com>

pkgname=ratarmount
pkgver=1.1.1
pkgrel=1
pkgdesc="Mount tar files via fusepy. Supports Recursive Mounting, Compressed Files, Read-Only Bind Mounting, Union Mounting and Write Overlays. A fast random access alternative to archivemount."
arch=(any)
url="https://github.com/mxmlnkn/$pkgname"
conflicts=("${pkgname}-git")
license=('MIT')
depends=(
    'python>=3.9'
    # AUR packages
    'python-mfusepy'
    'python-rapidgzip'
    'python-indexed-gzip'
    'python-xz'
    'python-indexed-zstd'
    # Extra repository packages
    'fuse2>=2.9'
    'python-rarfile'
    'python-libarchive-c'
)

optdepends=(
    'python-py7zr: Support for password-protected 7z archives.'
    'python-ext4: Support for EXT4 images.'
    'python-pyfatfs: Support for FAT12, 16, 32 images.'
    'python-fsspec: Support for remote files.'
    'python-aiohttp: Support for http:// via fsspec.'
    'python-requests: Support for various web backends such as github:// via fsspec.'
    'python-s3fs: Support for s3:// via fsspec.'
    'python-smbprotocol: Support for smb:// via fsspec.'
    'python-webdav4: Support for webdav:// via fsspec.'
)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)

_pkg_ext='.tar.gz'
source=("${pkgname}-${pkgver}${_pkg_ext}::${url}/archive/refs/tags/v${pkgver}${_pkg_ext}")
b2sums=('e9f65d3a9dfd58fd75e89a3e1a6a900174934ddec4f19e99a275b61c9dd5b5c9aa8fea270fcd660485294673721ce5ac4ed4a0ed48ff035c841bfc4c68b8a301')

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
