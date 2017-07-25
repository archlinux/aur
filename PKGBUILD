# Maintainer: Swift Geek <swifgeek  google c m>

pkgname=sdr-j-dabreceiver
pkgver=0.999
pkgrel=0
pkgdesc="software dab decoder for use with a dabstick, airspy or sdrplay for RPI and PC"
arch=('x86_64')
url="http://www.sdr-j.tk/"
license=('GPL2')
depends=('fftw' 'qwt' 'faad2' 'portaudio' 'qt5-quick1' 'rtl-sdr')
conflicts=('dabstick-radio')
replaces=('dabstick-radio')
makedepends=('cmake')
source=("https://github.com/JvanKatwijk/qt-dab/archive/qt-dab-${pkgver}.tar.gz")
md5sums=('bdde4c1f5abf4141c4a18c6c1ac96ff7')

build() {
  export CFLAGS="${CFLAGS} -Wno-unused" # Tons of unnecessary warnings, breaking terminal output :D
  export CXXFLAGS="${CFLAGS}"

  cd "$srcdir/qt-dab-qt-dab-${pkgver}/"
  ln -sf CMakeLists.txt-qt5 ./CMakeLists.txt


  # Actual build
  mkdir -p build
  cd build
  cmake_flags=(
    -DSPECTRUM=ON
    -DRTLTCP=ON
#    -DDABSTICK=ON
#    -DAIRSPY=ON
  )

  cmake ${cmake_flags[@]} ../

  make -j1 # Is this workaround still needed!?
}

package () {
  install -d "$pkgdir/usr/bin"

  install -m 755 "$srcdir/qt-dab-qt-dab-${pkgver}/build/qt-dab-${pkgver}" "$pkgdir/usr/bin/qt-dab"
}
