# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-climatology
pkgver=1.6.33.0
pkgrel=1
pkgdesc="Climatology plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/climatology.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/climatology_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/c1d82631756056437edc58235d9e1ff68b46ddf3.tar.gz" "$pkgname-$pkgver-data.tar.gz::https://github.com/seandepagnier/climatology_pi_data/archive/006120320bde2c1ad8da10a911cdf2b0f3bffe0d.tar.gz" "stdint.patch")
b2sums=('4d82cf41ce4ad64171b1e4c69c9b198a8924e3b9defed42321114e1f7085da03bdb3fe71e7a73fc86a1a8f70dd83621058a1b4e41d867b05dfeecef1dc6588c1' '009b51f58e65af83db8212d39a86d69d98c48888318926e9bd1f0fac48f800e1cd6151e213ef8c241ff46b4c6dad1e435efb19d76d0af5850f3c0836b598defc' '48672347a2b384f9b68ce6b7397702bc050244408a843fbd7b9478c67105133034608d96ce502f65b5a52492c5359ca9f518718de8f7fd4f0d893f9344caa0ae' '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-c1d82631756056437edc58235d9e1ff68b46ddf3/* climatology_pi-$pkgver/opencpn-libs
  cp -r climatology_pi_data-006120320bde2c1ad8da10a911cdf2b0f3bffe0d/* climatology_pi-${pkgver}/data
  cd climatology_pi-$pkgver
  patch --strip=1 --input=../stdint.patch
}
          
build() {
  cd climatology_pi-$pkgver
  mkdir -p build
  cd build
  #Force GTK3, suppress cmake warnings, allow C++11
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON ..
  make
}

package() {
  cd climatology_pi-$pkgver/build
  DESTDIR="$pkgdir" make install
}
