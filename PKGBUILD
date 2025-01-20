# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=dektec-avfifo-examples
pkgver=2023.2
pkgrel=9
_sdkver=2025.01.0
pkgdesc='Code examples demonstrating the AvFifo API for receiving and transmitting SMPTE 2110 streams'
arch=('x86_64')
url="https://www.dektec.com/downloads/SDK/#linux"
license=('LicenseRef-custom')
depends=(
  'dektec-drivers-dkms'
  'gcc-libs' 
  'glibc' 
  'sdl2'
)
makedepends=('make')
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz"
        "https://www.dektec.com/products/SDK/AvFifoExamples/downloads/avfifo_examples.tar.gz")
sha256sums=('47ee7d8ef0bea6c6e57723608af22b499eb9d2f790b45609015c853c7b9f7e15'
            '378109bd8548ff6d210f78efd24057022c5fb1e96e74a570b62fab7941c1c8bb')

prepare() {
  # Define common paths
  local dtapi_include="LinuxSDK/DTAPI/Include"
  local dtapi_lib="LinuxSDK/DTAPI/Lib/GCC7.5.0"
  local avfifo_examples="avfifo_examples"
  local dtapi_dest_include="${avfifo_examples}/Common/DTAPI/include"
  local dtapi_dest_lib="${avfifo_examples}/Common/DTAPI/lib/GCC8"

  # Include DTAPI (SDK) for AvFifo
  cp "${dtapi_include}/DTAPI.h" "${dtapi_dest_include}"
  cp "${dtapi_include}/DTAPI_AvFifo.h" "${dtapi_dest_include}"
  cp -r "${dtapi_lib}"/* "${dtapi_dest_lib}"
}

build() {
  # Compile AvFifoRx
  cd "${srcdir}/avfifo_examples/AvFifo_VideoRx"
  make

  # Compile AvFifoTx
  cd "${srcdir}/avfifo_examples/AvFifo_VideoTx"
  make
}

package() {
  # Install AvFifoRx and AvFifoTx binaries
  install -Dm755 "${srcdir}/avfifo_examples/AvFifo_VideoRx/AvFifo_VideoRx" "${pkgdir}/usr/bin/AvFifo_VideoRx"
  install -Dm755 "${srcdir}/avfifo_examples/AvFifo_VideoTx/AvFifo_VideoTx" "${pkgdir}/usr/bin/AvFifo_VideoTx"
  
  # Install license file
  install -Dm644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
