# Maintainer: Petr Belohlavek <me@petrbel.cz>
# Maintainer: Jan Jirak <jan.jirak@iterait.com>
# Maintainer: Filip Matzner <floop@floop.cz>

pkgname=libedgetpu-git
pkgver=20240314  # google-coral/libedgetpu has no numeric versioning; using yyyymmdd instead
pkgrel=3
pkgdesc="Google Coral Edge TPU library and headers"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/google-coral/libedgetpu"
license=('Apache 2.0')
depends=('libusb' 'flatbuffers=24.3.25' 'abseil-cpp')
makedepends=('binutils' 'git' 'tar')
provides=('libedgetpu')
conflicts=('libedgetpu' 'libedgetpu-std' 'libedgetpu-max')

tensorflow_version=2.18.0

source=("git+https://github.com/google-coral/libedgetpu.git#commit=e35aed18fea2e2d25d98352e5a5bd357c170bd4d"
        "https://github.com/tensorflow/tensorflow/archive/refs/tags/v${tensorflow_version}.tar.gz"
        "makefile.patch"
        "usb_device_interface.patch"
        "60-libedgetpu1.rules")
sha256sums=('SKIP'                                                               # google-coral/libedgetpu
            'd7876f4bb0235cac60eb6316392a7c48676729860da1ab659fb440379ad5186d'   # tensorflow/tensorflow
            'ea555199fd029cb8498d45b38a4ad5042d80c1c82938acd9f0f313502535db2d'   # makefile.patch
            '9bafe65b550909367e76d8b727284ddef2c0dafd7358a0ff304232c5fbaa9038'   # usb_device_interface.patch
            'a1482c69523be15629f571f76916875e39fa64b6e5098058588bffa87a2a62d8')  # 60-libedgetpu1.rules

prepare() {
  cd "$srcdir/libedgetpu"
  patch makefile_build/Makefile < "${srcdir}/makefile.patch"
  patch driver/usb/usb_device_interface.h < "${srcdir}/usb_device_interface.patch"
  tar -xzf "${srcdir}/v${tensorflow_version}.tar.gz"
}

build() {
  cd "$srcdir/libedgetpu"
  TFROOT="tensorflow-${tensorflow_version}" make -f makefile_build/Makefile -j$(nproc) libedgetpu
}

package() {
  cd "$srcdir/libedgetpu"

  install -dm755 "${pkgdir}/usr/lib"
  install -Dm644 "out/direct/k8/libedgetpu.so.1.0" "${pkgdir}/usr/lib/libedgetpu.so.1.0"
  ln -sf libedgetpu.so.1.0 "${pkgdir}/usr/lib/libedgetpu.so.1"
  ln -sf libedgetpu.so.1 "${pkgdir}/usr/lib/libedgetpu.so"

  install -dm755 "${pkgdir}/usr/include"
  install -Dm644 "tflite/public/edgetpu.h" "${pkgdir}/usr/include/"
  install -Dm644 "tflite/public/edgetpu_c.h" "${pkgdir}/usr/include/"

  install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
  install -Dm644 "${srcdir}/60-libedgetpu1.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
