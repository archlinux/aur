# Maintainer: Michael Schantl <floss at schantl dash lx dot at>
# Upstream authors: Andrew Murray, Hugo van Kemenade, Grégoire Jadi, Michał Górny, Yay295 and contributors

# Supports automatic update checking

_name=python-pillow
pkgname=${_name}95
_MAJOR=9
_MAJOR_MAX=$_MAJOR
_MINOR=5
_MINOR_MAX=$_MINOR
_PATCH=0
pkgver=$_MAJOR.$_MINOR.$_PATCH

function _dl_url {
  echo "https://github.com/python-pillow/Pillow/archive/refs/tags/$1.$2.$3.tar.gz"
}

pkgrel=1
pkgdesc='Python Imaging Library (PIL) fork - 9.5 branch'
arch=('x86_64')
url='https://python-pillow.org'
license=('BSD')
provides=("python-pillow=$pkgver")
conflicts=('python-pillow')
depends=(
  'freetype2'
  'lcms2'
  'libimagequant'
  'libraqm'
  'libtiff'
  'libxcb'
  'openjpeg2'
  'python'
  'python-packaging'
)
makedepends=(
  'git'
  'libwebp'
  'python-build'
  'python-installer'
  'python-packaging'
  'python-setuptools'
  'python-wheel'
  'tk'
)
checkdepends=('python-pytest')
optdepends=(
  'libwebp: for webp images'
  'python-olefile: OLE2 file support'
  'python-pyqt5: for the ImageQt module'
  'tk: for the ImageTK module'
)
source=("${_name}-${pkgver}.tar.xz::$(_dl_url $_MAJOR $_MINOR $_PATCH)")
b2sums=('663c14b89ddd1e2d49872994033a04e500d0b6eccbb8d6ce094f58ae1aaf3f215e9984f2afeb43fb83e0c3c93af1150beeb7d5f0abb77c59087901b53fd24e37')

build() {
    cd "$srcdir/Pillow-${pkgver}"

    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/Pillow-${pkgver}"

    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version"
    python selftest.py
    pytest -v
}

package() {
    cd "$srcdir/Pillow-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    install -vDm644 -t "$pkgdir/usr/include/python$python_version" src/libImaging/*.h

    # license
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

