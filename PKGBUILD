# Maintainer: Sergey Slipchenko <faergeek@gmail.com>

pkgname=retroarch-rbp
pkgver=1.7.6
pkgrel=1
pkgdesc='Reference frontend for the libretro API (Raspberry Pi)'
arch=('armv7h')
url='http://www.libretro.com/'
license=('GPL')
groups=('libretro')
provides=('retroarch')
conflicts=('retroarch')
depends=(
  alsa-lib
  libass.so
  libavcodec.so
  libavformat.so
  libavutil.so
  libdrm
  libfreetype.so
  libgl
  libswresample.so
  libswscale.so
  libudev.so
  libusb-1.0.so
  raspberrypi-firmware
  v4l-utils
  zlib
)
makedepends=(
  vulkan-icd-loader
)
optdepends=(
  'libretro-overlays: Collection of overlays'
  'libretro-shaders: Collection of shaders'
  'python: retroarch-cg2glsl'
  'retroarch-assets-xmb: XMB menu assets'
)
backup=(etc/retroarch.cfg)
source=(
  https://github.com/libretro/RetroArch/archive/v${pkgver}.tar.gz
  retroarch-config.patch
  service
  sysusers.conf
  tmpfiles.conf
)
sha256sums=('3d9a7cd13e5208c98367f93a0a859cf3bb2a55e9a700f5622719846f913daecf'
            'b8e0909c4cdfc4dd22dd48631ba95cc1838398da853d442f0ac486d69cba6fd6'
            '2e0fd9b160f66ed69630d562ecc0c7db06802d6373305e951f5ffecbdfc93cfb'
            'd4e4a5ac6c961eafb3edfc28186f75e471dc81e308791d57cfccae4f43de4dae'
            'e6055a91ca94379f63ff4e8437c085f8f64896a6ce2dd242c36954e48b60d29c')

prepare() {
  cd RetroArch-${pkgver}

  patch -Np1 -i ../retroarch-config.patch
}

build() {
  cd RetroArch-${pkgver}

  export PKG_CONFIG_PATH="/opt/vc/lib/pkgconfig:${PKG_CONFIG_PATH}"

  ./configure \
    --prefix='/usr' \
    --disable-al \
    --disable-cg \
    --disable-jack \
    --disable-oss \
    --disable-pulse \
    --disable-qt \
    --disable-sdl \
    --disable-sdl2 \
    --disable-vg \
    --disable-wayland \
    --disable-x11 \
    --enable-dispmanx \
    --enable-opengles \
    --enable-neon \
    --enable-floathard \
    --enable-videocore

  make
}

package() {
  cd RetroArch-${pkgver}

  make DESTDIR=${pkgdir} install
  install -Dm 644 ${srcdir}/service ${pkgdir}/usr/lib/systemd/system/retroarch.service
  install -Dm 644 ${srcdir}/sysusers.conf ${pkgdir}/usr/lib/sysusers.d/retroarch.conf
  install -Dm 644 ${srcdir}/tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/retroarch.conf
}
