# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-polar
pkgver=1.2.38.0
pkgrel=1
pkgdesc="Polar creation plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/polar.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/polar_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/6a29da61ff17184e7c5a4eb9b883996a80a60fd5.tar.gz" "stdint.patch")
b2sums=('e122985a729071763351e103fcecfa4db9acf8b0955e2bb427856256f1d491122499788e4e7fee0ea9d66f06c0603db7d47072a6ade56c5c049e4504780962ce' '02210f14e317962f9f776dfde5a32d7fea717a75fe909820b9e1f40cc534841a1d75f576e3cd6841fdc1c65f577834594550aec7e743a5964ec39aae81d2bb4c' '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-6a29da61ff17184e7c5a4eb9b883996a80a60fd5/* polar_pi-$pkgver/opencpn-libs
  cd polar_pi-$pkgver/
  patch --strip=1 --input=../stdint.patch
}

build() {
  cd polar_pi-$pkgver
  mkdir -p build
  cd build
  #Force GTK3, enable CXX11
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON -DUSE_GL=ON ..
  make
}

package() {
  cd polar_pi-$pkgver/build/
  DESTDIR="$pkgdir" make install
}
