# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdatachannel-git
pkgver=0.23.1.r6.g7a4b6c2d
pkgrel=1
pkgdesc="C/C++ WebRTC network library featuring Data Channels, Media Transport, and WebSockets"
arch=('i686' 'x86_64')
url="https://libdatachannel.org/"
license=('MPL-2.0')
depends=('gcc-libs' 'libjuice' 'libsrtp' 'openssl')
makedepends=('git' 'cmake')
provides=("libdatachannel=$pkgver")
conflicts=('libdatachannel')
source=("git+https://github.com/paullouisageneau/libdatachannel.git")
sha256sums=('SKIP')


prepare() {
  cd "libdatachannel"

  git submodule update --init --recursive
}

pkgver() {
  cd "libdatachannel"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libdatachannel"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DUSE_SYSTEM_JUICE=ON \
    -DUSE_SYSTEM_SRTP=ON \
    -DNO_EXAMPLES=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "libdatachannel"

  #cmake --build "_build" --target test
}

package() {
  cd "libdatachannel"

  DESTDIR="$pkgdir" cmake --install "_build"
}
