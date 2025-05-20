# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=qradiolink
_pkgver=0.9.1-3
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='VOIP (radio over IP) GNU/Linux SDR (software defined radio) transceiver application'
arch=('x86_64')
url='https://github.com/qradiolink/qradiolink'
license=('GPL-3.0-only' 'MIT' 'BSD' 'LGPL-3.0-only')
depends=('protobuf' 'boost-libs' 'qt5-base' 'qt5-multimedia' 'pulse-native-provider' 'log4cpp' 'abseil-cpp' 'opengl-driver'
         'libvolk' 'gnuradio' 'gnuradio-osmosdr' 'soapysdr' 'libuhd' 'freedv' 'codec2' 'libftdi-compat'
         'speex' 'libconfig' 'cppzmq' 'alsa-lib' 'libjpeg-turbo' 'libsndfile' 'gst-plugins-bad-libs' 'opus')
makedepends=('boost' 'limesuite' 'gst-plugins-bad')
optdepends=('limesuite: LimeSDR support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz"
        "$pkgname-pr-131.patch::$url/pull/131.patch"
        "$pkgname-pr-132.patch::$url/pull/132.patch")
sha512sums=('f1b01c8ee0d1cabc9c95c784dc3409467ae1a584d8f15f331dfadc001c7b1b94939b69bad52e0d6980770fadc06da982efb1d0f6dc555c258b6b03cd4439ea67'
            'bb8f050b052d1a5767d97454d82a033d1200bdebdd4d57df2e1009c683f9f7c919a5ef40e2aa81bc37b3869112ba0b6755ae980bb54a926c6701fef803c6785e'
            'f2f23df9cc785edc88314a4ce6b76ac85e20b4c91019727458d8a30a66cecf533c61ffce7a80ea74a854e8fa9cd06661e97b123fe747fe13b791ff35cd5f6870')

prepare() {
  cd $pkgname-$_pkgver

  patch -p1 -i ../$pkgname-pr-131.patch
  patch -p1 -i ../$pkgname-pr-132.patch

  cd src/ext

  protoc --cpp_out=. Mumble.proto
  protoc --cpp_out=. QRadioLink.proto
}

build() {
  mkdir -p $pkgname-$_pkgver/build
  cd $pkgname-$_pkgver/build

  qmake ..

  make
}

package() {
  cd $pkgname-$_pkgver

  install -Dm 755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm 755 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Install docs
  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r -a --no-preserve=ownership docs/* "$pkgdir"/usr/share/doc/$pkgname

  # Install licenses
  install -Dm 644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
  install -Dm 644 AUTHORS "$pkgdir"/usr/share/licenses/$pkgname/AUTHORS
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 LICENSE.MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.MIT
  install -Dm 644 LICENSE.LGPL3 "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.LGPL3
}
