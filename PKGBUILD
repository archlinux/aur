# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-devel-pvr-stalker
_gitname=pvr.stalker
pkgver=20151109.9a6d06e
_gitver=9a6d06e27bd6766286ecc923d3e6185f426d3812
_jsoncpp_ver=0.5.0
pkgrel=2
pkgdesc='Stalker Middleware PVR client addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/kodi-pvr/$_gitname"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake' 'kodi-devel-platform' 'kodi-devel-libplatform')
depends=('kodi-devel' 'jsoncpp' 'tinyxml')
source=(
  "https://github.com/kodi-pvr/$_gitname/archive/$_gitver.tar.gz"
  "https://github.com/open-source-parsers/jsoncpp/archive/svn-release-$_jsoncpp_ver.tar.gz"
  "jsoncpp-cmakelists.patch")
md5sums=(
  'SKIP'
  '11b6a4ff1bf1a8f34f6e4b813d61342e'
  'SKIP')

_prefix='/usr'

prepare() {
  msg "Building JsonCpp"

  cd "$srcdir/jsoncpp-svn-release-$_jsoncpp_ver"
  patch -p1 -i "$srcdir/jsoncpp-cmakelists.patch"
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POSITION_INDEPENDENT_CODE=on \
    ..
  make
  mkdir ../out
  make DESTDIR="../out" install
}

build() {
  msg "Starting make..."
  
  cd "$srcdir/$_gitname-$_gitver"
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DJSONCPP_INCLUDE_DIRS="$srcdir/jsoncpp-svn-release-$_jsoncpp_ver/out/usr/include/jsoncpp" \
    -DJSONCPP_LIBRARIES="$srcdir/jsoncpp-svn-release-$_jsoncpp_ver/out/usr/lib/libjsoncpp.a" \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
