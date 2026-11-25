# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

set -u
pkgname=taglib
pkgver=2.3.2
pkgrel=2
pkgdesc='A Library for reading and editing the meta-data of several popular audio formats'
pkgdesc+=' (32 bit)'
arch=(x86_64)
#url="https://developer.kde.org/~wheeler/taglib.html"
url='https://taglib.github.io/'
license=(LGPL-2.1-only
         MPL-1.1)
depends=(glibc
         gcc-libs
         zlib)
depends=("${depends[@]/#/lib32-}")
depends+=("${pkgname}>=${pkgver}" 'sh')
makedepends=(cmake
             git
             utf8cpp)
source=("https://taglib.github.io/releases/$pkgname-$pkgver.tar.gz")
md5sums=('3c8f621c54d274d41f54edee93ee39a6')
sha256sums=('3ca2d8afaa7f1cf7f6ed10e511ebc368bfacd6dcaa3dbfa690b89e502e8963dc')

_pkgname="${pkgname}"
pkgname="lib32-${pkgname}"

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  local _conf=(
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_INSTALL_LIBDIR=lib32
    -DBUILD_TESTING=OFF
  )
  cmake -B build -S ${_pkgname}-${pkgver} "${_conf[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgdir"
  rm -r usr/include/ # usr/share/
  mv usr/bin/taglib-config{,-32}
}
set +u
