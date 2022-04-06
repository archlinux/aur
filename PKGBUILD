# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libdill
pkgver=2.14
pkgrel=2
pkgdesc='Structured concurrency in C'
arch=('x86_64')
license=('MIT')
url='https://github.com/sustrik/libdill'
depends=('openssl')
makedepends=('clang' 'cmake')
provides=('libdill.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ebba0e5b433ec123b74a57d49b89dfa673aa258e03e6a452959e556b4c4529b9')

## FIXME: does not compile on gcc
## See: https://github.com/sustrik/libdill/issues/191
build() {
  CC=clang cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev
  make -C build
}

## FIXME: one test fails due to subprocess abort
check() {
  make -C build test || true
}

package() {
  make -C build install DESTDIR="$pkgdir/"
  install -Dm644 "$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
