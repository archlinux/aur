# Maintainer: pingplug < aur at pingplug dot me >
# Contributr: Patrick José Pereira < positivcheg94 at gmail dot com >

_commit=ce6a3a81f8ac5dd488b2f03358aab29fdc6c9512  # tags=v2.38.0
pkgname=librealsense
pkgver=v2.38.0
pkgrel=1
pkgdesc="Intel® RealSense™ SDK 2.0 is a cross-platform library for Intel® RealSense™ depth cameras (D400 series and the SR300)"
arch=('x86_64')
url="https://github.com/IntelRealSense/librealsense"
license=('Apache')
makedepends=('cmake' 'git')
depends=('glfw-x11' 'gtk3' 'libusb')
source=("git+https://github.com/IntelRealSense/librealsense#commit=${_commit}"
    "https://realsense-hw-public.s3.amazonaws.com/Releases/RS4xx/FW/D4XX_FW_Image-5.12.7.100.bin"
    "https://realsense-hw-public.s3.amazonaws.com/Releases/SR300/FW/SR3XX_FW_Image-3.26.1.0.bin"
    "https://realsense-hw-public.s3.amazonaws.com/Releases/TM2/FW/target/0.2.0.951/target-0.2.0.951.mvcmd"
    "https://realsense-hw-public.s3.amazonaws.com/Releases/L5xx/FW/L5XX_FW_Image-1.4.1.2.bin")
sha256sums=('SKIP'
            'f6a06019a59b963c6e53a5299af49a4e375989866587c20c17d432b689679b50'
            'c4ac2144df13c3a64fca9d16c175595c903e6e45f02f0f238630a223b07c14d1'
            '0265fd111611908b822cdaf4a3fe5b631c50539b2805d2f364c498aa71c007c0'
            '692b18825844da20075e0ed4bfa2c23be4bf15abf61380a0dbae9a72a91f90bb')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/-/+/g'

  mkdir -p build/common/fw/
  cp "../D4XX_FW_Image-5.12.7.100.bin" build/common/fw/
  cp "../SR3XX_FW_Image-3.26.1.0.bin" build/common/fw/
  cp "../target-0.2.0.951.mvcmd" build/common/fw/
  cp "../L5XX_FW_Image-1.4.1.2.bin" build/common/fw/
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
