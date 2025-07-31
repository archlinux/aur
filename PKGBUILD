# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-polar
pkgver=1.2.37.0
pkgrel=1
pkgdesc="Polar creation plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/polar.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/polar_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/c1d82631756056437edc58235d9e1ff68b46ddf3.tar.gz" "stdint.patch")
b2sums=('e1dcd2ab95fe28455bc854bb96efb8cf92429fcc83bf6b33e97c9d171b89e91f5e359fe781efe7dff2bfb51b5af445ebe2ab0b31ba540545d9a8f32d0c062e0b' '009b51f58e65af83db8212d39a86d69d98c48888318926e9bd1f0fac48f800e1cd6151e213ef8c241ff46b4c6dad1e435efb19d76d0af5850f3c0836b598defc' '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-c1d82631756056437edc58235d9e1ff68b46ddf3/* polar_pi-$pkgver/opencpn-libs
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
