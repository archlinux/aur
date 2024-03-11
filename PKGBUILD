# Maintainer: uli <cybuzuma at vnxs dot de>

pkgname=opencpn-plugin-o_charts
pkgver=2.0.0.66
pkgrel=3
pkgdesc="use charts from o-charts.org in opencpn"
arch=('x86_64' 'aarch64')
license=("GPL2" "custom")
depends=('opencpn' 'libusb-compat')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/ocharts.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/bdbcat/o-charts_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/38762f4e7b8faf39133cc40efc99b12b5200f04b.tar.gz" "LICENSE")
b2sums=('bc7fe398df635fbcc57df7311bf94f3beb20d65dd907f7823008af4321f67054d12c0ed62309ed37583e58975170db471e1d49b78b401a516471c02506f87610' '744751565f17160a927c9be8db98f7600dd78d612af9eda4d59aa2b31ca543e3d21d147c3c3134426a4d7d0d9e075d1f0d5b07a5102f8f8da823e9451caa219a' '2d09f9bc4f793b03977d05607f065fbd85e8c257edb70d27b8846f620f920d23803e320045ae3e6cc23e862d0c52336b8e334580d946518f86f4260c0a886deb')

prepare() {
  cp -r opencpn-libs-38762f4e7b8faf39133cc40efc99b12b5200f04b/* o-charts_pi-${pkgver}/opencpn-libs
}

build() {
  cmake -S o-charts_pi-${pkgver} -B build -DCMAKE_BUILD_TYPE=None -Wno-dev -Dplugin_target=AUR
  cmake --build build -t tarball-install
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # upstream is using make install for their packaging so we need to copy the files manually
  cd o-charts_pi-${pkgver}/build/app/files/
  cp -r ./* $pkgdir/usr/
  rm $pkgdir/usr/metadata.xml
}
