# Maintainer: uli <cybuzuma at vnxs dot de>

pkgname=opencpn-plugin-o_charts
pkgver=2.0.6.0
pkgrel=1
pkgdesc="use charts from o-charts.org in opencpn"
arch=('x86_64' 'aarch64')
license=("GPL2" "custom")
depends=('opencpn' 'libusb-compat')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/ocharts.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdbcat/o-charts_pi/archive/refs/tags/${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/a001083af21de2e3faa970b245877a5ee5899aba.tar.gz" "LICENSE")
b2sums=('419ccbf90292cdfd53f4137f4e8947ce2bfa32a40a4ef2015c7070af3e29f28a6bc8297af0b777f33178130d9cb47b5f3d204fab35f6dee4d03f3071a639b3e0' '24215376af8780b00e3611f2f9c2f3a408afcddfffc25c408117e0219eb0c70ca7805af349acb7616b900498d7b8e821db6ec2e18109247e81969f08b98a74aa' '2d09f9bc4f793b03977d05607f065fbd85e8c257edb70d27b8846f620f920d23803e320045ae3e6cc23e862d0c52336b8e334580d946518f86f4260c0a886deb')


prepare() {
  cp -r opencpn-libs-a001083af21de2e3faa970b245877a5ee5899aba/* o-charts_pi-${pkgver}/opencpn-libs
}

build() {
  cmake -S o-charts_pi-${pkgver} -B build -DCMAKE_BUILD_TYPE=None -Wno-dev -Dplugin_target=AUR
  cmake --build build -t tarball-install
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # upstream is using make install for their packaging so we need to copy the files manually
  cd build/app/files/
  cp -r ./* $pkgdir/usr/
  rm $pkgdir/usr/metadata.xml
}
