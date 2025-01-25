# Maintainer: Hoel Kervadec <hoel@kervadec.bzh>
## Fork of the python-pillow package https://archlinux.org/packages/extra/x86_64/python-pillow/

pkgname=python-pillow-simd-git
pkgver=10.2
pkgrel=1
pkgdesc='Highly optimized downstream Pillow fork'
arch=('x86_64')
url='https://python-pillow.github.io/pillow-perf/'
license=('MIT-CMU')
conflicts=(python-pillow)
provides=(python-pillow=${pkgver})
depends=(
  'glibc'
  'python'
  'python-packaging'
  'freetype2'
  'lcms2'
  'libraqm'
  'libtiff'
  'openjpeg2'
  'libjpeg-turbo'
  'libimagequant'
  'libxcb'
  'zlib'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'libwebp'
  'tk'
)
checkdepends=(
  'python-pytest'
  'python-pytest-timeout'
)
optdepends=(
  'libwebp: for webp images'
  'tk: for the ImageTK module'
  'python-olefile: OLE2 file support'
  'python-pyqt6: for the ImageQt module'
  'python-defusedxml: for reading XMP tags'
)
source=(
  "$pkgname::git+https://github.com/uploadcare/pillow-simd"
)
b2sums=('SKIP')

prepare() {
  cd "$pkgname"
}

build() {
  cd "$pkgname"

  CC="cc -mavx2" python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python selftest.py
  test-env/bin/python -m pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  install -vDm644 -t "$pkgdir/usr/include/python$python_version" src/libImaging/*.h

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
