# Maintainer: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Nikolas P <nikodemus.p@gmx.at>

pkgname=libindi-3rdparty-config
pkgver=2.0.5
pkgrel=1
pkgdesc="3rd party drivers for INDI, configured by /etc/indi.conf"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL3)
arch=(i686 x86_64)
depends=(libvorbis libusb openal libnova libjpeg libindi=${pkgver} libgphoto2 libftdi-compat cfitsio dcraw libftdi rtl-sdr libraw gpsd)

makedepends=(cmake boost)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("17f5a0536f2ee6bfbcbdcdde9a44c2e59c2156637004193f650bdd2dda123291")

prepare() {
  mkdir -p build
  cd  indi-3rdparty-${pkgver}
  #set all to off by default
  sed -i -e '/option(WITH_.*On)$/s/ On)$/ Off)/' CMakeLists.txt
  find ./ -name CMakeLists.txt -exec sed -i -e 's|^cmake_minimum_required.*|cmake_minimum_required(VERSION 3.5)|g' {} \; # Avoid Warning of CMake < 3.5
}

build() {
  cd build
  #
  # Read Config
  #
  while IFS=" " read -r module mode
  do
     if [ ${mode^^} = "ON" ]; then
        build_args="${build_args} -DWITH_${module}=On"
     fi
  done < /etc/indi.conf
  
  #
  echo "Build the base-libraries"
  #
  cmake --fresh \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DUDEVRULES_INSTALL_DIR=/etc/udev/rules.d \
        -DBUILD_LIBS=1 \
        ${build_args} \
        ../indi-3rdparty-${pkgver}
  make DESTDIR="/tmp/${pkgname}_${pkgver}" install
  #
  cmake --fresh \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUDEVRULES_INSTALL_DIR=/etc/udev/rules.d \
    ${build_args} \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cp -R /tmp/${pkgbase}_${pkgver}/* $pkgdir
  cd build
  make DESTDIR="$pkgdir" install
  rm -rf /tmp/${pkgname}_${pkgver}
}
