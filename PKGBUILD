# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: minder

pkgname=python38-pillow
pkgver=9.3.0
pkgrel=1
pkgdesc='Python Imaging Library (PIL) fork'
arch=('x86_64')
url='https://python-pillow.org'
license=('BSD')
depends=(
  'python38'
  'freetype2'
  'lcms2'
  'libraqm'
  'libtiff'
  'openjpeg2'
  'libimagequant'
  'libxcb'
)
makedepends=(
  'git'
  'python38-build'
  'python38-installer'
  'python38-wheel'
  'python38-setuptools'
  'libwebp'
  'tk'
)
checkdepends=('python38-pytest')
optdepends=(
  'libwebp: for webp images'
  'tk: for the ImageTK module'
  'python38-olefile: OLE2 file support'
  'python38-pyqt5: for the ImageQt module'
)
_commit='d594f4cb8dc47fb0c69ae58d9fff86faae4515bd'
source=("$pkgname::git+https://github.com/python-pillow/Pillow#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local python_version=$(python3.8 -m 'import sys; print("".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython38-$python_version"
  python38 selftest.py
  pytest -v
}

package() {
  cd "$pkgname"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  local python_version=$(python3.8 -m 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  install -vDm644 -t "$pkgdir/usr/include/python$python_version" src/libImaging/*.h

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

