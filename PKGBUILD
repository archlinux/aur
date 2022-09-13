# Maintainer: uli <cybuzuma at vnxs dot de>

pkgname=opencpn-plugin-o_charts
pkgver=1.0.29.0
pkgrel=1
pkgdesc="use charts from o-charts.org in opencpn"
arch=('x86_64' 'aarch64')
license=("GPL2" "custom")
depends=('opencpn' 'libusb-compat')
makedepends=('cmake' 'lsb-release' 'git')
url="https://opencpn.org/OpenCPN/plugins/ocharts.html"
source=("$pkgname::git+https://github.com/bdbcat/o-charts_pi.git#commit=49dee9c5a98635a13f418eddc52dda3666296835" "wx_workaround.patch" "LICENSE")
b2sums=('SKIP' 'e72db7fb9af2fa05c93a412f3ea0a8b3a58f77e1e1347c3110b646d9c9558dde35f00422a4e70ebb4a0f07840b09d8a236ddb6c283015127b64d9ef4648b465f' '2d09f9bc4f793b03977d05607f065fbd85e8c257edb70d27b8846f620f920d23803e320045ae3e6cc23e862d0c52336b8e334580d946518f86f4260c0a886deb')

prepare() {
  cd $pkgname
  patch --strip=1 --input=../wx_workaround.patch
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make tarball
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # upstream is using make install for their packaging so we need to copy the files manually
  cd "$pkgname"/build/app/o-charts-1.0.29.0-arch-rolling/
  cp -r ./* $pkgdir/usr/
  rm $pkgdir/usr/metadata.xml
}
