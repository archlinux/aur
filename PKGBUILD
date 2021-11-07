# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-pycxx
_name=${pkgname#python-}
pkgver=7.1.5
pkgrel=1
pkgdesc="Write Python extensions in C++"
arch=('any')
url="http://cxx.sourceforge.net"
license=('BSD')
depends=('python')
source=("https://downloads.sourceforge.net/cxx/$_name-$pkgver.tar.gz"
        'PyCXX.pc'
        "$pkgname-7-change-include-paths.patch")
sha256sums=('9087a8574ac9caf631a8ec0b90e260828051e4bc89e1e44f4fc253ccc297d826'
            'a4597b98a7e110a18f08896f98fb12614f5c96a24642119db16672d7616f35a9'
            '8ed381d9542265fcfbac2a50398edf49d44ac4fb59bf6b2455e45fa427fd7d42')

prepare() {
  cd "$_name-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname-7-change-include-paths.patch"
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  export PKG_CONFIG_PATH="$srcdir":/usr/lib/pkgconfig
  test "$(pkg-config --modversion PyCXX)" = "$pkgver"
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 "$srcdir/PyCXX.pc" -t "$pkgdir/usr/share/pkgconfig/"
  install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
