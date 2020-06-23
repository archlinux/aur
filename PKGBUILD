# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sergey Slipchenko <faergeek@gmail.com>
# Contributor: Themaister <maister@archlinux.us>
# Contributor: lifning <definelightning@gmail.com>

_pkgname=retroarch
pkgname=retroarch-rbp4
pkgver=1.8.9
pkgrel=1
pkgdesc='Reference frontend for the libretro API (Raspberry Pi 4)'
arch=(armv7h)
url=http://www.libretro.com/
license=(GPL)
groups=(libretro)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-rbp")
depends=(
  alsa-lib
  flac
  libass.so
  libavcodec.so
  libavformat.so
  libavutil.so
  libfreetype.so
  libswresample.so
  libswscale.so
  libudev.so
  libusb-1.0.so
  libxkbcommon
  mbedtls
  mesa
  miniupnpc
  v4l-utils
)
makedepends=(
  git
)
optdepends=(
  'libretro-overlays: Collection of overlays'
  'libretro-shaders: Collection of shaders'
  'python: retroarch-cg2glsl'
  'retroarch-assets-ozone: Ozone menu assets'
  'retroarch-assets-xmb: XMB menu assets'
)
backup=(etc/retroarch.cfg)
_tag=2e115baf36058d6f099db1ae7cf6dbdacb21c53c
source=(
  git+https://github.com/libretro/RetroArch.git#tag=${_tag}
  retroarch-config.patch
  service
  sysusers.conf
  tmpfiles.conf
)
sha256sums=(
  SKIP
  7857cff30c45721b66666828ca9edbb2923817c6c64591be3f58fe019277103e
  2e0fd9b160f66ed69630d562ecc0c7db06802d6373305e951f5ffecbdfc93cfb
  d4e4a5ac6c961eafb3edfc28186f75e471dc81e308791d57cfccae4f43de4dae
  e6055a91ca94379f63ff4e8437c085f8f64896a6ce2dd242c36954e48b60d29c
)

pkgver() {
  cd RetroArch

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd RetroArch

  patch -Np1 -i ../retroarch-config.patch

  git cherry-pick -n 685948368e6b28b97e1b91bdfe5921519359a033 # FS#66843
}

build() {
  cd RetroArch

  ./configure \
    --prefix=/usr \
    --disable-al \
    --disable-builtinflac \
    --disable-builtinmbedtls \
    --disable-builtinminiupnpc \
    --disable-builtinzlib \
    --disable-cg \
    --disable-dispmanx \
    --disable-jack \
    --disable-oss \
    --disable-pulse \
    --disable-qt \
    --disable-sdl \
    --disable-sdl2 \
    --disable-vg \
    --disable-wayland \
    --disable-x11 \
    --disable-videocore \
    --disable-vulkan \
    --disable-vulkan_display \
    --enable-kms \
    --enable-opengles \
    --enable-opengles3 \
    --enable-opengl_core \
    --enable-plain_drm
  make
  make -C libretro-common/audio/dsp_filters
  make -C gfx/video_filters
}

package() {
  cd RetroArch

  make DESTDIR="${pkgdir}" install

  install -Dm 644 libretro-common/audio/dsp_filters/*.{dsp,so} -t "${pkgdir}"/usr/lib/retroarch/filters/audio/
  install -Dm 644 gfx/video_filters/*.{filt,so} -t "${pkgdir}"/usr/lib/retroarch/filters/video/

  install -Dm 644 "${srcdir}"/service "${pkgdir}"/usr/lib/systemd/system/retroarch.service
  install -Dm 644 "${srcdir}"/sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/retroarch.conf
  install -Dm 644 "${srcdir}"/tmpfiles.conf "${pkgdir}"/usr/lib/tmpfiles.d/retroarch.conf
}

# vim: ts=2 sw=2 et:
