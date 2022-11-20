# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgbase=python38-brotli
pkgname=('brotli38' 'python38-brotli' 'brotli38-testdata')
_gitcommit=e61745a6b7add50d380cfd7d3883dd6c62fc2c71
pkgver=1.0.9
pkgrel=9
pkgdesc='Generic-purpose lossless compression algorithm'
url='https://github.com/google/brotli'
arch=('x86_64')
license=('MIT')
makedepends=('git' 'glibc' 'gcc-libs' 'cmake' 'python38-setuptools')
options=('debug')
source=(${pkgname}::"git+${url}#commit=${_gitcommit}")
sha512sums=('SKIP')

prepare() {
  cd ${pkgbase}
  git cherry-pick -n 09b0992b6acb7faa6fd3b23f9bc036ea117230fc # Fix broken Libs: in pc file
}

pkgver() {
  cd ${pkgbase}
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgbase}
  python3.8 setup.py build
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=True \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects"
  cmake --build build -v
}

check() {
  cd ${pkgbase}
  python3.8 setup.py test
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package_brotli38() {
  depends=('gcc-libs' 'glibc')
  provides=(libbrotlicommon.so libbrotlidec.so libbrotlienc.so)

  cd ${pkgbase}
  DESTDIR="$pkgdir" cmake --install build
  local man
  for man in docs/*.?; do
    install -Dm 644 "$man" "$pkgdir/usr/share/man/man${man##*.}/${man##*/}"
  done
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python38-brotli() {
  pkgdesc+=' - python library'
  depends=('python38' 'glibc' 'gcc-libs')

  cd ${pkgbase}
  python3.8 setup.py install --skip-build -O1 --root="$pkgdir"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_brotli38-testdata() {
  pkgdesc+=' - test data'
  depends=()

  cd ${pkgbase}
  install -dm755 "$pkgdir"/usr/share/brotli38
  cp -a tests/testdata "$pkgdir"/usr/share/brotli38/
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}