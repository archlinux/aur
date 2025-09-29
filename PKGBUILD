# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-avfifo-examples
pkgver=2025.6
pkgrel=1
_sdkver=2025.09.0
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
        "https://www.dektec.com/products/SDK/AvFifoExamples/downloads/avfifoexamples.tar.gz")
sha256sums=('5617767108c5782b0485f1d3f5e0d94ea5fcdb4a6c66fd62525188c0e401f173'
            'd697bd5a17999d6f5aacef3cea607669ca6e1350a2238aee451c4415e2f60171')

prepare() {
  # Define common paths
  local dtapi_include="LinuxSDK/DTAPI/Include"
  local dtapi_lib="LinuxSDK/DTAPI/Lib/GCC7.5.0"
  local avfifo_examples="avfifo_examples"
  local dtapi_dest_include="${avfifo_examples}/Common/DTAPI/include"
  local dtapi_dest_lib="${avfifo_examples}/Common/DTAPI/lib"

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

  # Install documentation
  install -Dm644 "${srcdir}/avfifo_examples/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "${srcdir}/avfifo_examples/DTAPI Reference - AvFifo.pdf" \
    "${pkgdir}/usr/share/doc/${pkgname}/DTAPI_Reference_AvFifo.pdf"
}

# vim:set ts=2 sw=2 et:
