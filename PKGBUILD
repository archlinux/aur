# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Based on the python-pillow package (Maintainer: Kyle Keen <keenerd@gmail.com>, Contributor: minder)

pkgname=python-pillow-simd
pkgver=9.2.0
pkgrel=1
epoch=1
_name=Pillow-SIMD
_lower_name=pillow-simd
_py3basever=3.10
pkgdesc="Python Imaging Library (PIL) fork. Pillow fork for better image processing performance."
arch=('x86_64')
url="https://github.com/uploadcare/pillow-simd"
license=('custom')
depends=('python' 'freetype2' 'lcms2' 'libraqm' 'libtiff' 'openjpeg2' 'libimagequant' 'libxcb')
optdepends=('libwebp: for webp images'
            'tk: for the ImageTK module'
            'python-olefile: OLE2 file support'
            'python-pyqt5: for the ImageQt module')
makedepends=('python-setuptools' 'libwebp' 'tk')
checkdepends=('python-pytest')
source=("https://github.com/uploadcare/pillow-simd/archive/refs/tags/$pkgver.tar.gz")
#source=("https://github.com/uploadcare/pillow-simd/archive/refs/tags/v$pkgver.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
conflicts=('python-pillow')
provides=("python-pillow=$pkgver")

build() {
  cd "$srcdir/$_lower_name-$pkgver"
  python3 setup.py build
}

check() {
  cd "$srcdir/$_lower_name-$pkgver"
  
  export PYTHONPATH="$PWD/build/lib.linux-$CARCH-${_py3basever%m}"
  python selftest.py
  pytest
}

package() {
  cd "$srcdir/$_lower_name-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/include/python$_py3basever/"
  install -m644 -t "$pkgdir/usr/include/python$_py3basever/" src/libImaging/*.h
}

sha256sums=('1c3b4bce334fbb234be506cd3146a93714f9de43032aaf807ff47a20d6b42c95')
