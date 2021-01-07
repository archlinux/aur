# Maintainer: pingplug < aur at pingplug dot me >
# Contributr: Patrick José Pereira < positivcheg94 at gmail dot com >

_commit=4f37f2ef0874c1716bce223b20e46d00532ffb04  # tags=v2.41.0
_RS4XX_VER=5.12.10.0
_SR300_VER=3.26.1.0
_TM2_VER=0.2.0.951
_L5XX_VER=1.5.3.0

pkgname=librealsense
pkgver=v2.41.0
pkgrel=1
pkgdesc="Intel® RealSense™ SDK 2.0 is a cross-platform library for Intel® RealSense™ depth cameras (D400 series and the SR300) and the T265 tracking camera."
arch=('x86_64')
url="https://github.com/IntelRealSense/librealsense"
license=('Apache')
makedepends=('cmake' 'git')
depends=('glfw-x11' 'gtk3' 'libusb')
source=("git+https://github.com/IntelRealSense/librealsense#commit=${_commit}"
    "https://realsense-hw-public.s3.amazonaws.com/Releases/RS4xx/FW/D4XX_FW_Image-${_RS4XX_VER}.bin"
    "https://realsense-hw-public.s3.amazonaws.com/Releases/SR300/FW/SR3XX_FW_Image-${_SR300_VER}.bin"
    "https://realsense-hw-public.s3.amazonaws.com/Releases/TM2/FW/target/${_TM2_VER}/target-${_TM2_VER}.mvcmd"
    "https://realsense-hw-public.s3.amazonaws.com/Releases/L5xx/FW/L5XX_FW_Image-${_L5XX_VER}.bin")
sha256sums=('SKIP'
            'c44731a31ffc76a1acb4cb34aef57e4ec5372fa70f58a73cab04294683308b10'
            'c4ac2144df13c3a64fca9d16c175595c903e6e45f02f0f238630a223b07c14d1'
            '0265fd111611908b822cdaf4a3fe5b631c50539b2805d2f364c498aa71c007c0'
            '187e281fb02cdc8e441fc433850ebebef01d9d9318654ec5c7499404590d1fa3')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/+/g'
}

prepare(){
  cd "${srcdir}/${pkgname}"
  sed -i 's|, GROUP:="plugdev"||g' "config/99-realsense-libusb.rules"
  sed -i 's|, GROUP="plugdev"||g' "config/99-realsense-libusb.rules"

  mkdir -p build/common/fw/
  cp "../D4XX_FW_Image-${_RS4XX_VER}.bin" build/common/fw/
  cp "../SR3XX_FW_Image-${_SR300_VER}.bin" build/common/fw/
  cp "../target-${_TM2_VER}.mvcmd" build/common/fw/
  cp "../L5XX_FW_Image-${_L5XX_VER}.bin" build/common/fw/
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build && cd build
  CFLAGS="${CFLAGS} -Wformat -pthread" \
  CXXFLAGS="${CXXFLAGS} -Wformat -pthread" \
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on \
    -DBUILD_WITH_STATIC_CRT=off \
    -DBUILD_WITH_OPENMP=on \
    -DBUILD_EXAMPLES=true \
    -DBUILD_WITH_TM2=true
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  DESTDIR="${pkgdir}" make install
  cd "${srcdir}/${pkgname}/config"
  install -Dm644 99-realsense-libusb.rules "${pkgdir}/etc/udev/rules.d/99-realsense-libusb.rules"
}
