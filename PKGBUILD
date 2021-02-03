# Maintainer: Sergey Slipchenko <faergeek@gmail.com>

pkgname=retroarch-rbp
pkgver=1.8.9
pkgrel=1
pkgdesc='Reference frontend for the libretro API (Raspberry Pi)'
arch=(armv7h)
url=http://www.libretro.com/
license=(GPL)
groups=(libretro)
provides=(retroarch)
conflicts=(retroarch)
depends=(
  alsa-lib
  flac
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
  mbedtls
  miniupnpc
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
  'retroarch-assets-ozone: Ozone menu assets'
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
sha256sums=('87afcf89327cc7ddafec74df98e0172bc7419e37c9c7a033514b32befc809529'
            '7857cff30c45721b66666828ca9edbb2923817c6c64591be3f58fe019277103e'
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
    --prefix=/usr \
    --disable-al \
    --disable-builtinflac \
    --disable-builtinmbedtls \
    --disable-builtinminiupnpc \
    --disable-builtinzlib \
    --disable-cg \
    --disable-opengl1 \
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
    --enable-floathard \
    --enable-opengl_core \
    --enable-videocore \
    --enable-dbus \
    --enable-opengles
  make
}

package() {
  cd RetroArch-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -Dm 644 ${srcdir}/service ${pkgdir}/usr/lib/systemd/system/retroarch.service
  install -Dm 644 ${srcdir}/sysusers.conf ${pkgdir}/usr/lib/sysusers.d/retroarch.conf
  install -Dm 644 ${srcdir}/tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/retroarch.conf
}
