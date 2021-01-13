# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=lib32-libmikmod-git
pkgver=3.3.11.1
pkgrel=1
pkgdesc="Module player library supporting many formats, including MOD, S3M, IT and XM (32-bit)"
url=http://mikmod.sourceforge.net
license=(
  GPL2
  LGPL2.1
)
arch=(x86_64)
depends=(
  lib32-glibc
  lib32-libpulse
  libmikmod
)
makedepends=(
  lib32-alsa-lib
  cmake
)
provides=(libmikmod.so lib32-libmikmod)
conflicts=(lib32-libmikmod)
source=(git://git.code.sf.net/p/mikmod/mikmod.git)
sha256sums=('SKIP')

pkgver() {
  cd mikmod
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  # cmake ignores CPPFLAGS
  CFLAGS+=" $CPPFLAGS"

  cmake -Hmikmod/libmikmod -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_SUFFIX=32 \
    -DENABLE_DL=1
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --build build --target install
  rm -r "$pkgdir"/usr/{bin,include}
}

# vim: ts=2 sw=2 et:
