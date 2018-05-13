# Maintainer: Tobias Markus <tobias AT miglix DOT eu>

_pkgbase=libsioclient
pkgname="$_pkgbase-git"
pkgdesc="C++11 implementation of Socket.IO client"
pkgver=1.6.1.r27.g6063cb1
pkgrel=1
arch=('x86_64')
url="https://github.com/socketio/socket.io-client-cpp.git"
license=('custom:MIT')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'boost')
depends=('openssl' 'boost-libs' 'websocketpp' 'rapidjson')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
    "$_pkgbase::git+https://github.com/socketio/socket.io-client-cpp.git"
    'cmake.patch')
md5sums=('SKIP'
         '9b25e8ba1fa73823512242205a395be1')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  patch -d "$srcdir/$_pkgbase" -i "$srcdir/cmake.patch"

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "../$_pkgbase"
}

build() {
  cd "$srcdir/build"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -D -m644 "../$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
