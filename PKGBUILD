# Maintainer: Beej <beej@beej.us>
# Contributor: libele <libele@disroot.org>
# Contributor: John Robinson <jbr100uk@googlemail>
# Contributor: Rene Wiermer <rwiermer@googlemail>
# Contributor: Eric Forgeot <http://ifiction.free.fr>

pkgname=frobtads
pkgver=2.0
pkgrel=5
pkgdesc="Combined TADS 2 & 3 interpreter and compilers for playing and creating Interactive Fiction games"
arch=('i686' 'x86_64')
url="https://tads.org/frobtads.htm"
license=('custom: freeware')
depends=('ncurses' 'curl')
makedepends=('cmake' 'git')
source=(
    "https://github.com/realnc/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2"
    "frobtads-aur.patch"
)
sha256sums=('893bd3fd77dfdc8bfe8a96e8d7bfac693da0e4278871f10fe7faa59cc239a090'
            '287ce3bb12ebe6925ce83fd94624f11ef2d434cdbc82bef7780a64d652655130')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Patch the CMakefile to get a working build
  patch -Np1 < ${srcdir}/frobtads-aur.patch

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cd build
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  cd build
  make DESTDIR="$pkgdir" install

  cd ..
  install -Dm644 tads3/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
