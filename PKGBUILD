# Maintainer: Swift Geek <swifgeek  google c m>

pkgname=sdr-j-dabreceiver
pkgver=0.994
pkgrel=0
pkgdesc="The DAB decoding software (SDR-J)"
arch=('x86_64')
url="http://www.sdr-j.tk/"
license=('GPL2')
depends=('fftw' 'qwt-qt5' 'faad2' 'portaudio' 'qt5-quick1' 'rtl-sdr')
conflicts=('dabstick-radio')
replaces=('dabstick-radio')
makedepends=('cmake')
source=("https://github.com/JvanKatwijk/sdr-j-dab/archive/V${pkgver}.tar.gz")
md5sums=('28ac6cb65ce53d37e86f36cdae8ede54')

build() {
  export CFLAGS="${CFLAGS} -Wno-unused" # Tons of unnecessary warnings, breaking terminal output :D
  export CXXFLAGS="${CFLAGS}"

  cd "$srcdir/sdr-j-dab-${pkgver}/"

  # Toggle build-in features/device support
  sed -i '/set(SDRPLAY true)/d' CMakeLists.txt
#  sed -i '/set(AIRSPY true)/d' CMakeLists.txt
#  sed -i '/set(DABSTICK true)/d' CMakeLists.txt
#  sed -i '/^#.*set(RTLTCP true)/s/^#//' CMakeLists.txt # THIS ONE UNCOMMENTS
#  sed -i '/set(SPECTRUM true)/d' CMakeLists.txt
  sed -i '/set (objectName sdr-j-dabreceiver-/c\set (objectName sdr-j-dabreceiver)' CMakeLists.txt

  # Actual build
  mkdir -p build
  cd build
  cmake -DAIRSPYLIB_INCLUDE_DIR='/usr/include/libairspy/' ../
  make -j1 # Is this workaround still needed!?
}

package () {
  install -d "$pkgdir/usr/bin"

#  install -m 755 "$srcdir/sdr-j-dab-${pkgver}/build/sdr-j-dabreceiver-${pkgver}" "$pkgdir/usr/bin/sdr-j-dabreceiver"
  install -m 755 "$srcdir/sdr-j-dab-${pkgver}/build/sdr-j-dabreceiver" "$pkgdir/usr/bin/sdr-j-dabreceiver"
}
