# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherfax
pkgver=1.10.17.0
pkgrel=1
pkgdesc="Open image files directly, or decode audio faxes to an image. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
optdepends=('rtl-sdr: decode from rtlsdr')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/weatherfax.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/weatherfax_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/c1d82631756056437edc58235d9e1ff68b46ddf3.tar.gz" "stdint.patch")
b2sums=('bbd375a4eb608637fd2fd035880877dfdef3dbff1772f8a6b2ed7746a93ba1881962d554db5d24232f8fa15c077f644f5331e51cb008d09bb5136b5aff238620' '009b51f58e65af83db8212d39a86d69d98c48888318926e9bd1f0fac48f800e1cd6151e213ef8c241ff46b4c6dad1e435efb19d76d0af5850f3c0836b598defc'  '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-c1d82631756056437edc58235d9e1ff68b46ddf3/* weatherfax_pi-${pkgver}/opencpn-libs
  cd weatherfax_pi-${pkgver}
  patch --strip=1 --input=../stdint.patch
}

build() {
  cd weatherfax_pi-$pkgver
  mkdir -p build
  cd build
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON -DUSE_GL=ON ..
  make
}

package() {
  cd weatherfax_pi-$pkgver/build
  DESTDIR="$pkgdir" make install
}
