# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libcloudstorage-git
pkgver=1.2.r385.gf7b5d81
pkgrel=2
pkgdesc="C++ library providing access to files located in various cloud services"
arch=('i686' 'x86_64')
url="https://code.videolan.org/videolan/libcloudstorage"
license=('LGPL')
depends=('boost-libs' 'crypto++' 'curl' 'fuse3' 'jsoncpp' 'libmicrohttpd' 'mega-sdk' 'tinyxml2')
makedepends=('git' 'boost')
provides=('libcloudstorage')
conflicts=('libcloudstorage')
source=("git+https://code.videolan.org/videolan/libcloudstorage.git"
        "0001-Fix-compilation-with-newer-crypto.patch")
sha256sums=('SKIP'
            '6e44c6986af6b1717fca2287324c58264266ab8e80d5aabb55f50f04dd7f22de')


prepare() {
  cd "libcloudstorage"

  patch -Np1 -i "$srcdir/0001-Fix-compilation-with-newer-crypto.patch"
  git submodule update --init
}

pkgver() {
  cd "libcloudstorage"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libcloudstorage"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libcloudstorage"

  make check
}

package() {
  cd "libcloudstorage"

  make DESTDIR="$pkgdir" install
}
