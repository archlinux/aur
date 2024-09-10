# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=ffmpeg-dektec
pkgver=2024.05.0
pkgrel=4
_sdkver=2024.06.1
pkgdesc="FFmpeg Integration for DekTec Devices"
arch=('x86_64')
url="https://www.dektec.com/products/SDK/ffmpeg/"
license=('LicenseRef-nonfree-and-unredistributable')
depends=(
  'alsa-lib'
  'bzip2'
  'dektec-drivers-dkms'
  'gcc-libs'
  'glibc'
  'libva'
  'libvdpau'
  'libx11'
  'libxcb'
  'libxext'
  'libxv'
  'sdl2'
  'xz'
  'zlib'
)
makedepends=('yasm')
source=("FFmpeg_v${pkgver}.tar.gz::https://www.dektec.com/products/SDK/ffmpeg/linux/downloads/FFmpeg_v${pkgver}.tar.gz"
        "LinuxSDK_v${_sdkver}.tar.gz::https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz")
noextract=("FFmpeg_v${pkgver}.tar.gz")
sha256sums=('c07d952c210967896bb3ab87753e15191936a87b68840034a876b850f423cbf6'
            '903772f0ef251dad1871e6110bd17409dab502ad7c1e49dfcf2882df3f082d98')

prepare() {
  # Extract all files from DekTec upstream
  mkdir -p "${pkgname}-${pkgver}"
  bsdtar -xf "FFmpeg_v${pkgver}.tar.gz" -C "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  # Include pkg-config path for DTAPI
  export PKG_CONFIG_PATH="${srcdir}/LinuxSDK/DTAPI/Lib/GCC7.5.0/pkgconfig"
  # Build
  ./configure \
    --prefix='/usr' \
    --disable-shared \
    --disable-doc \
    --disable-asm \
    --disable-vulkan \
    --disable-ffprobe \
    --enable-static \
    --enable-small \
    --enable-dektec \
    --enable-nonfree
  make
  # Fasttools
  #make tools/qt-faststart
}

package() {
  # Custom standalone installation
  install -vDm 755 "${pkgname}-${pkgver}/ffmpeg" "${pkgdir}/usr/bin/ffmpeg-dektec"
  install -vDm 755 "${pkgname}-${pkgver}/ffplay" "${pkgdir}/usr/bin/ffplay-dektec"

  # Standard installation method
  #make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install install-man
  #install -Dm 755 "${pkgname}-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"

  # Licenses
  install -vDm 644 ${pkgname}-${pkgver}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/License-ffmpeg"
  install -vDm 644 LinuxSDK/License "${pkgdir}/usr/share/licenses/${pkgname}/License-dektec"
}

# vim:set ts=2 sw=2 et:
