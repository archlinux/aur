# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=ffmpeg-dektec
pkgver=2025.04.0
pkgrel=4
_sdkver=2026.05.0
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
  'libdrm'
  'libva'
  'libvdpau'
  'libx11'
  'libxext'
  'libxv'
  'libxcb'
  'sdl2'
  'sndio'
  'xz'
  'zlib'
)
makedepends=(
  'pkg-config'
  'yasm'
)
options=('!lto' '!debug')
source=(
  "FFmpeg_v${pkgver}.tar.gz::https://www.dektec.com/products/SDK/ffmpeg/linux/downloads/FFmpeg_v${pkgver}.tar.gz"
  "LinuxSDK_v${_sdkver}.tar.gz::https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz"
)
noextract=("FFmpeg_v${pkgver}.tar.gz")
sha256sums=('b1f83ddcbf602a2a4b7b29864a54e21cfa4ff86c4707c9c945629359027afd69'
            'de710978c419ce7a5c5cfd387d8fa68a1529cd29017d23bbdcc84fdb29e48c7f')

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
    --enable-static \
    --enable-ffplay \
    --enable-ffprobe \
    --enable-small \
    --enable-dektec \
    --enable-nonfree
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  # Install binaries
  install -vDm 755 "ffmpeg" "${pkgdir}/usr/bin/ffmpeg-dektec"
  install -vDm 755 "ffplay" "${pkgdir}/usr/bin/ffplay-dektec"
  install -vDm 755 "ffprobe" "${pkgdir}/usr/bin/ffprobe-dektec"

  # Licenses
  install -vDm 644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.FFmpeg"
  install -vDm 644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.DekTec"
}

# vim: set ts=2 sw=2 et:
