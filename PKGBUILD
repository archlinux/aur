# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=ffmpeg-dektec
pkgver=2024.05.0
pkgrel=6
_sdkver=2025.01.0
pkgdesc="FFmpeg Integration for DekTec Devices"
arch=('x86_64')
url="https://www.dektec.com/products/SDK/ffmpeg/"
license=('LicenseRef-FFmpeg' 'LicenseRef-DekTec')
depends=(
  'alsa-lib'
  'bzip2'
  'dektec-drivers-dkms'
  'gcc-libs'
  'glibc'
  'libva'
  'libvdpau'
  'libx11'
  'libxext'
  'libxv'
  'libxcb'
  'sdl2'
  'xz'
  'zlib'
)
makedepends=(
  'pkg-config'
  'yasm'
)
source=(
  "FFmpeg_v${pkgver}.tar.gz::https://www.dektec.com/products/SDK/ffmpeg/linux/downloads/FFmpeg_v${pkgver}.tar.gz"
  "LinuxSDK_v${_sdkver}.tar.gz::https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz"
)
noextract=("FFmpeg_v${pkgver}.tar.gz")
sha256sums=('c07d952c210967896bb3ab87753e15191936a87b68840034a876b850f423cbf6'
            '47ee7d8ef0bea6c6e57723608af22b499eb9d2f790b45609015c853c7b9f7e15')

prepare() {
  # Extract all files from DekTec upstream
  install -dm755 "${pkgname}-${pkgver}"
  bsdtar -xf "FFmpeg_v${pkgver}.tar.gz" -C "${pkgname}-${pkgver}"

  # Extract the SDK
  install -dm755 "${srcdir}/LinuxSDK"
  bsdtar -xf "LinuxSDK_v${_sdkver}.tar.gz" -C "${srcdir}/LinuxSDK"
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
  # make tools/qt-faststart
}

package() {
  cd "${pkgname}-${pkgver}"
  # Custom standalone installation
  install -vDm 755 "ffmpeg" "${pkgdir}/usr/bin/ffmpeg-dektec"
  install -vDm 755 "ffplay" "${pkgdir}/usr/bin/ffplay-dektec"

  # Standard installation method
  # make DESTDIR="$pkgdir" install install-man
  # install -Dm 755 "tools/qt-faststart" -t "${pkgdir}/usr/bin"

  # Licenses
  install -vDm 644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.FFmpeg"
  install -vDm 644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.DekTec"
}

# vim: set ts=2 sw=2 et:
