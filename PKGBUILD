# Maintainer: uli <cybuzuma at vnxs dot de>

pkgname=opencpn-plugin-o_charts
pkgver=2.0.32.0
pkgrel=1
pkgdesc="use charts from o-charts.org in opencpn"
arch=('x86_64' 'aarch64')
license=("GPL2" "custom")
depends=('opencpn' 'libusb-compat')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/ocharts.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdbcat/o-charts_pi/archive/refs/tags/${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/facd6f684e8b851619a100e5601626e2002e1d42.tar.gz" "LICENSE")
b2sums=('71019d4ac0475848f8cdc1de6e0b3d8d2b54dfdea8e2a174128a2fa32315840fa35ca00b49d64d7f33f0c8d3b0f20ed043f30a8c7f8ddf24eed95e4a609c6b6f' 'd6036bf37df6704d1fd92d475cd6e717c702d82b962103433b91ff7dbb541c0931e2b4b12f80bfa7a0840ee96178edbc746c57bb2c0d9057da59c19625e72c33' '2d09f9bc4f793b03977d05607f065fbd85e8c257edb70d27b8846f620f920d23803e320045ae3e6cc23e862d0c52336b8e334580d946518f86f4260c0a886deb')


prepare() {
  cp -r opencpn-libs-facd6f684e8b851619a100e5601626e2002e1d42/* o-charts_pi-${pkgver}/opencpn-libs
}

build() {
  cd o-charts_pi-${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=None -Wno-dev -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -Dplugin_target=AUR ..
  make tarball-install
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # upstream is using make install for their packaging so we need to copy the files manually
  cd o-charts_pi-${pkgver}
  cd build/app/files/
  cp -r ./* $pkgdir/usr/
  rm $pkgdir/usr/metadata.xml
  rm -rf $pkgdir/usr/include/
  rm -rf $pkgdir/usr/lib/cmake
  rm -rf $pkgdir/usr/lib/pkgconfig
  rm -rf $pkgdir/usr/lib/libGLEW.a
}
