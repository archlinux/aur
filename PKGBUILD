# Maintainer: a821 at (nospam) mail de
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: congyiwu <congyiwu AT gmail DOT com>

pkgname=json-c-git
pkgver=r1376.7bca694
pkgrel=2
epoch=1
pkgdesc="A JSON implementation in C"
url="https://github.com/json-c/json-c/wiki"
license=(MIT)
arch=(x86_64)
depends=(glibc)
makedepends=(git cmake ninja)
provides=(libjson-c.so json-c)
conflicts=(json-c)
source=("git+https://github.com/json-c/json-c")
sha256sums=('SKIP')

pkgver() {
  cd json-c
  # no tags are reachable from HEAD
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}


build() {
  cmake -S json-c -B build -G Ninja \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_STATIC_LIBS=OFF \
    -DENABLE_THREADING=ON \
    -DENABLE_RDRAND=OFF
  cmake --build build
}

check() {
  ctest --output-on-failure --stop-on-failure --test-dir build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 json-c/COPYING
}

# vim:set sw=2 et:
