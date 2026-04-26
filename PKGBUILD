# Maintainer: uli <cybuzuma at vnxs dot de>

pkgname=opencpn-plugin-o_charts
pkgver=2.1.15
pkgrel=1
pkgdesc="use charts from o-charts.org in opencpn"
arch=('x86_64' 'aarch64')
license=("GPL2" "custom")
depends=('opencpn' 'libusb-compat')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/ocharts.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdbcat/o-charts_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/6a29da61ff17184e7c5a4eb9b883996a80a60fd5.tar.gz" "LICENSE")
b2sums=('67eec29e2c2461f18c08f5fe1f3b573a357cb09ef5c33d89cec6a1ea914a529c99190bc656db193a17666276b07fe187cd339e4aa6a174367a624a4146d21c74' '02210f14e317962f9f776dfde5a32d7fea717a75fe909820b9e1f40cc534841a1d75f576e3cd6841fdc1c65f577834594550aec7e743a5964ec39aae81d2bb4c' '2d09f9bc4f793b03977d05607f065fbd85e8c257edb70d27b8846f620f920d23803e320045ae3e6cc23e862d0c52336b8e334580d946518f86f4260c0a886deb')


prepare() {
  cp -r opencpn-libs-6a29da61ff17184e7c5a4eb9b883996a80a60fd5/* o-charts_pi-${pkgver}/opencpn-libs
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
