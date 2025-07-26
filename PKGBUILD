# Maintainer: Jens Schwander <thomas747a@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksy Grabowski <hurufu+arch@gmail.com>

pkgname=python-pynng
pkgver=0.8.1
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
    'python-cffi'
)
checkdepends=(
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-trio'
)
# The source line renames the downloaded file for consistency
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Confirmed correct checksum
sha256sums=('4cbebde4951b197c44c99b6e8783a96fb7164581a827590eb775a4726461be55')

# The directory name inside the tarball is pynng-0.8.1
_sourcedir="pynng-$pkgver"

build() {
    cd "$_sourcedir"
    python setup.py build
}

check() {
    cd "$_sourcedir"
    # Add the just-built library to the path so pytest can find it
    export PYTHONPATH="$srcdir/$_sourcedir/build/lib"
    pytest
}

package() {
    cd "$_sourcedir"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}