# Maintainer: Petr Belohlavek <me@petrbel.cz>
# Maintainer: Jan Jirak <jan.jirak@iterait.com>
# Maintainer: Filip Matzner <floop@floop.cz>

pkgname=libedgetpu-git
pkgver=20240314  # google-coral/libedgetp has no numeric versioning; using yyyymmdd instead
pkgrel=1
pkgdesc="Google Coral Edge TPU library and headers"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/google-coral/libedgetpu"
license=('Apache 2.0')
depends=('libusb' 'flatbuffers' 'abseil-cpp')
makedepends=('binutils' 'git' 'tar')
provides=('libedgetpu')
conflicts=('libedgetpu' 'libedgetpu-std' 'libedgetpu-max')

tensorflow_version=2.17.0

source=("git+https://github.com/google-coral/libedgetpu.git#commit=e35aed18fea2e2d25d98352e5a5bd357c170bd4d"
        "https://github.com/tensorflow/tensorflow/archive/refs/tags/v${tensorflow_version}.tar.gz"
        "makefile.patch"
        "60-libedgetpu1.rules")
sha256sums=('SKIP'  # google-coral/libedgetpu
            '9cc4d5773b8ee910079baaecb4086d0c28939f024dd74b33fc5e64779b6533dc'  # tensorflow/tensorflow
            '0ce680b418aa4ca61f5df7b0fa067df12158b646bfd46be221f0573a9944d716'  # makefile.patch
            'a1482c69523be15629f571f76916875e39fa64b6e5098058588bffa87a2a62d8')  # 60-libedgetpu1.rules

prepare() {
  #mv tensorflow libedgetpu/tensorflow
  cd "$srcdir/libedgetpu"
  patch makefile_build/Makefile < "${srcdir}/makefile.patch"
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
