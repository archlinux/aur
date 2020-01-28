# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=cpp-hocon
pkgver=0.2.1
pkgrel=6
pkgdesc="C++ port of the Typesafe Config library"
arch=('x86_64')
url="https://github.com/puppetlabs/cpp-hocon"
license=('APACHE')
depends=('boost-libs' 'gcc-libs' 'glibc' 'leatherman' 'leatherman_util.so' 'leatherman_locale.so')
makedepends=('boost' 'cmake' 'leatherman' 'rapidjson')
provides=('libcpp-hocon.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/cpp-hocon/archive/$pkgver.tar.gz"
        $pkgname-boost-1.72.patch::https://github.com/puppetlabs/cpp-hocon/commit/caab27550982.patch)
sha512sums=('fcc377da7923b77436a6f2787d5b8b1b573f239de4f059c4a5949cbb1a755fd12024b9155f5e44cf60141181942f3e9a2a8fad07ee0b1d516fe2cd4a88d4ac8b'
            '1c73065ace6ec957b0d7241f680e475708deedad43d2a200b4877350e0712dbf13aea8b0c12c7a0d02c12e2c0b3f201ae85b952969eb66e390276bed83a5d7ad')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-boost-1.72.patch
}

build() {
  cd "$pkgname-$pkgver"

  mkdir -p build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_CXX_WERROR=OFF \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DBUILD_SHARED_LIBS=ON \
    ..
  make
}

check() {
  cd "$pkgname-$pkgver"/build

  make test
}

package() {
  cd "$pkgname-$pkgver"

  make -C build install DESTDIR="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
