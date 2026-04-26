# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-climatology
pkgver=1.6.35.0
pkgrel=1
pkgdesc="Climatology plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/climatology.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/climatology_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/6a5616930143528470442e376349ccc2be7800b4.tar.gz" "$pkgname-$pkgver-data.tar.gz::https://github.com/seandepagnier/climatology_pi_data/archive/006120320bde2c1ad8da10a911cdf2b0f3bffe0d.tar.gz" "stdint.patch")
b2sums=('52c131cb48071146684fbc3067cc75e180c3a2ad747cfc97986ff5cbee41c9afaf9cb463e8b9298d7801617f659f55c6375dd09a9a42f0c247131686a0518358' 'ef0c05e6a55dda4fdec5020a4868aa55442d55748de211127473753ea4f72920fc52dbbfcb1a99b571a0321cc86f2ce7d1168b5e1d0a54470aaa3690d648d788' '48672347a2b384f9b68ce6b7397702bc050244408a843fbd7b9478c67105133034608d96ce502f65b5a52492c5359ca9f518718de8f7fd4f0d893f9344caa0ae' '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-6a5616930143528470442e376349ccc2be7800b4/* climatology_pi-$pkgver/opencpn-libs
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
