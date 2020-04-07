# Maintainer: dexterlb <dexterlb@qtrp.org>

pkgname=openfec
pkgver=1.4.2
pkgrel=2
pkgdesc="Open Forward Erasure Codes"
arch=('x86_64' 'i686' 'aarch64' 'armv7l' 'armv6l' 'armv7h' 'armv6h')
url="https://openfec.org"
license=('CeCill')
depends=()
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::http://openfec.org/files/openfec_v1_4_2.tgz")
sha256sums=('ccf1252b548505d198de768609c08c722a35e580c53b843e4372b7c52674ce12')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}_v${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  install -Dm755 ${pkgname}_v${pkgver}/bin/Release/libopenfec.so.$pkgver "$pkgdir/usr/lib/libopenfec.so.$pkgver"
  ln -s libopenfec.so.$pkgver "$pkgdir/usr/lib/libopenfec.so.1"
  ln -s libopenfec.so.$pkgver "$pkgdir/usr/lib/libopenfec.so"
  install -Dm644 ${pkgname}_v${pkgver}/LICENCE_CeCILL-C_V1-en.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/include"
  cp -rfT ${pkgname}_v${pkgver}/src "$pkgdir/usr/include/openfec"
  find "$pkgdir/usr/include/openfec" -type d -exec chmod 755 '{}' \;
  find "$pkgdir/usr/include/openfec" -type f -exec chmod 644 '{}' \;
  find "$pkgdir/usr/include/openfec" -type f -not -iname '*.h' -delete
  find "$pkgdir/usr/include/openfec" -type d -empty -delete
}
