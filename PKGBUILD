# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <maister@archlinux.us>
# Contributor: lifning <definelightning@gmail.com>

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - enable GLES

# Sergey Slipchenko <faergeek@gmail.com>
#  - add videocore paths to PKG_CONFIG_PATH
#  - enable neon
#  - enable floathard
#  - enable videocore

buildarch=4

pkgname=retroarch-rbp
pkgver=1.7.5
pkgrel=1.1
pkgdesc='Reference frontend for the libretro API (Raspberry Pi)'
arch=('armv7h')
url='http://www.libretro.com/'
license=('GPL')
groups=('libretro')
provides=('retroarch')
conflicts=('retroarch')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libdrm' 'libgl' 'libpulse' 'libx11'
         'libxcb' 'libxext' 'libxinerama' 'libxkbcommon' 'libxv' 'libxxf86vm'
         'raspberrypi-firmware'  'openal' 'qt5-base' 'sdl2' 'v4l-utils' 'wayland' 'zlib'
         'libass.so' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
         'libfreetype.so' 'libswresample.so' 'libswscale.so' 'libudev.so'
         'libusb-1.0.so')
makedepends=('git' 'vulkan-icd-loader')
optdepends=('libretro-overlays: Collection of overlays'
            'libretro-shaders: Collection of shaders'
            'python: retroarch-cg2glsl'
            'retroarch-assets-xmb: XMB menu assets')
backup=('etc/retroarch.cfg')
source=("git+https://github.com/libretro/RetroArch.git#tag=v${pkgver}"
        'retroarch-config.patch')
sha256sums=('SKIP'
            'd79c542c126b74a1b221fcc1acbe053b95f76c6c9a6ccefd10b8f459ceee94dd')

prepare() {
  cd RetroArch

  #patch -Np0 -i ../retroarch-config.patch
}

build() {
  cd RetroArch

  export PKG_CONFIG_PATH="/opt/vc/lib/pkgconfig:$PKG_CONFIG_PATH"

  ./configure \
    --prefix='/usr' \
    --disable-cg \
    --disable-jack \
    --disable-oss \
    --disable-sdl \
    --enable-opengles \
    --enable-neon \
    --enable-floathard \
    --enable-videocore

  make
  make -C libretro-common/audio/dsp_filters
  make -C gfx/video_filters
}

package() {
  cd RetroArch

  make DESTDIR="${pkgdir}" install

  install -Dm 644 libretro-common/audio/dsp_filters/*.{dsp,so} -t "${pkgdir}"/usr/lib/retroarch/filters/audio/
  install -Dm 644 gfx/video_filters/*.{filt,so} -t "${pkgdir}"/usr/lib/retroarch/filters/video/
}

# vim: ts=2 sw=2 et:
