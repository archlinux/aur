# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-pycxx
_name=${pkgname#python-}
pkgver=7.1.7
pkgrel=1
pkgdesc="Write Python extensions in C++"
arch=('any')
url="http://cxx.sourceforge.net"
license=('BSD')
depends=('python')
source=("https://downloads.sourceforge.net/cxx/$_name-$pkgver.tar.gz"
        'PyCXX.pc')
sha256sums=('a2798ae850460d66cbe59769c6df447ea457a5fd29c516b26a0a9ecadd4bbcb4'
            '84a1f4598ea64d4594cba7dff93c3e68f210e134ca3350f395015489d375a5e4')

prepare() {
  cd "$_name-$pkgver"

  # Without this, pysvn fails.
  # Src/Python3/cxxextensions.c: No such file or directory
  sed -e "/^#include/s:Src/::" -i Src/*.{c,cxx}
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
