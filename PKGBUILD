# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: congyiwu <congyiwu AT gmail DOT com>

pkgname=json-c-git
pkgver=0.15
pkgrel=1
pkgdesc="A JSON implementation in C"
url="https://github.com/json-c/json-c/wiki"
license=(MIT)
arch=(x86_64)
depends=(glibc)
makedepends=(git cmake)
provides=(libjson-c.so json-c)
conflicts=(json-c)
source=("git+https://github.com/json-c/json-c")
sha256sums=('SKIP')

pkgver() {
  cd json-c
  local tag="$(git describe --tags --abbrev=0)"
  local ver="$(git describe --tags)"
  echo "${tag%-*}${ver#$tag}" | sed 's/^json-c-//;s/-/+/g'
}

prepare() {
  cd json-c
}

build() {
  CFLAGS+=" $CPPFLAGS"
  CXXFLAGS+=" $CPPFLAGS"

  cmake -Hjson-c -Bbuild \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_THREADING=ON \
    -DENABLE_RDRAND=OFF
  cmake --build build
}

#check() {
#  cmake --build build --target test
#}

package() {
  DESTDIR="$pkgdir" cmake --build build --target install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 json-c/COPYING
}

# vim:set sw=2 et:
