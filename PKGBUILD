# Maintainer: Jens Schwander <thomas747a@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksy Grabowski <hurufu+arch@gmail.com>

pkgname=python-pynng
pkgver=0.9.0
pkgrel=1
pkgdesc='Ergonomic bindings for nanomsg next generation (nng), in Python'
arch=('x86_64' 'aarch64')
url='https://github.com/codypiersall/pynng'
license=('MIT')
depends=(
    'python>=3.12'
    'python-sniffio'
)
makedepends=(
    'cmake'
    'git' # Required by setup.py to clone nng and mbedtls
    'ninja'
    'python-setuptools'
    'python-setuptools-scm'
    'python-cffi'
)
checkdepends=( 
    'python-pytest-asyncio'
    'python-pytest-trio'
)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66f0b87007a0d90bc0ee13e6cfeeefc1d5aa7deb0dc06a05b4689516acce757b')

_sourcedir="pynng-$pkgver"

prepare() {
    cd "$_sourcedir"

    # GCC 15 introduced -Werror=unterminated-string-initialization which breaks
    # mbedTLS 3.6.x. Append the new flag to the existing CMAKE_C_FLAGS entry.
    sed -i 's/-Wno-error=array-bounds"/-Wno-error=array-bounds -Wno-error=unterminated-string-initialization"/' setup.py
}

build() {
    cd "$_sourcedir"
    # setuptools-scm cannot detect the version from a GitHub tarball (no .git).
    # This env var tells it the version directly, bypassing git detection.
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYNNG="$pkgver"
    python setup.py build
}

check() {
    cd "$_sourcedir"
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYNNG="$pkgver"
    export PYTHONPATH="$srcdir/$_sourcedir"
    pytest
}

package() {
    cd "$_sourcedir"
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYNNG="$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
