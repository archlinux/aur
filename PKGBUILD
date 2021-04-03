# Maintainer: pingplug < aur at pingplug dot me >
# Contributr: Patrick José Pereira < positivcheg94 at gmail dot com >

_commit=5ff27fca5aaeec4736d6bb3bfb958fee82ee198b  # tags=v2.44.0
_RS4XX_VER=5.12.12.100
_SR300_VER=3.26.1.0
_TM2_VER=0.2.0.951
_L5XX_VER=1.5.5.0

pkgname=librealsense
pkgver=v2.44.0
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
            '1ac04368a3a38947e4d54cd7adcd1635e56d9bb282de7ca9d96c57b98ce6965b'
            'c4ac2144df13c3a64fca9d16c175595c903e6e45f02f0f238630a223b07c14d1'
            '0265fd111611908b822cdaf4a3fe5b631c50539b2805d2f364c498aa71c007c0'
            '5cbbb52c604b41fa5d09f9222d0248a285e10ef3db637f6b2b0803ca8f75117b')

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
