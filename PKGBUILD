# Maintainer: Snogard <snogardb at gmail dot com>
# Contributor: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>
# Contributor: Maximilian Knespel <mxmlnknp at gmail dot com>

pkgname=ratarmount
pkgver=1.2.1
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
    'python-rich'
    'python-rich-argparse'
    # Extra repository packages
    'fuse2>=2.9'
    'python-rarfile'
    'python-libarchive-c'
)

optdepends=(
    'python-py7zr: Support for password-protected 7z archives.'
    'python-ext4: Support for EXT4 images.'
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
b2sums=('b890ee9c4a551f92ad819c6cf118f212e0d60127f2c3e8c45aafbfabd6408a4edec31ebc627736c1d4ae031e9598c752a804ec762dc38ce0b715e74ebc5f1c65')

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
