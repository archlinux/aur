# Maintainer: Snogard <snogardb at gmail dot com>
# Contributor: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>
# Contributor: Maximilian Knespel <mxmlnknp at gmail dot com>

pkgname=ratarmount
pkgver=1.0.0
pkgrel=2
pkgdesc="Mount tar files via fusepy. Supports Recursive Mounting, Compressed Files, Read-Only Bind Mounting, Union Mounting and Write Overlays. A fast random access alternative to archivemount."
arch=(any)
url="https://github.com/mxmlnkn/$pkgname"
conflicts=("${pkgname}-git")
license=('MIT')
depends=(
    'python>=3.9'
    # AUR packages
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
b2sums=('5cdd6179a4a3c76af25339a2de10674fe236f543fe9a7d5c70310934b9163de9d8433e565b8a28017ddee202f8226c58e286ffbb2c4c66b3377c7a5ee2fce0d7')

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
