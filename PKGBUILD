# Maintainer: a821 at (nospam) mail de
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Maxime Vincent <maxime.vince@gmail.com>

pkgname=wolfssl-git
pkgver=5.7.6.r280.gdb0fa304a
pkgrel=1
pkgdesc='Lightweight, portable, C-language-based SSL/TLS library'
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('cmake' 'git')
url='https://www.wolfssl.com/'
source=(git+https://github.com/wolfSSL/wolfssl.git)
sha256sums=('SKIP')
provides=("${pkgname%-git}" "libwolfssl.so")
conflicts=("${pkgname%-git}")

pkgver() {
  cd wolfssl
  git describe --long --tags | sed 's/^v//;s/-stable//;s/-/.r/;s/-/./g'
}

build() {
  cmake -B build -S wolfssl \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D WOLFSSL_CURVE25519=ON \
    -D WOLFSSL_CURVE448=ON \
    -D WOLFSSL_ED25519=ON \
    -D WOLFSSL_ED448=ON \
    -D WOLFSSL_REPRODUCIBLE_BUILD=ON \
    -D WOLFSSL_SNI=ON \
    -D WARNING_C_FLAGS="$CFLAGS" \
    -W no-dev

  cmake --build build
}

check() {
  ./build/wolfcrypt/test/testwolfcrypt
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 wolfssl/{README,ChangeLog}.md -t "$pkgdir/usr/share/doc/wolfssl"
}
