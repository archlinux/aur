# Maintainer: Jay Paul <elitedevx@gmail.com>
#
# Generate new listing of cores: 
# pacaur -s libretro | sed 's/aur\///' | sed 'N;s/\n/ /' | awk '{print $1}'
#
# This package tracks the latest source code on GitHub.
# Do not mark as out-of-date unless there are issues with the build!
#
# Cloning specific tags:
#   source=("git+https://github.com/libretro/RetroArch.git#tag=v${pkgver}")
#

pkgname=retroarch-git
pkgver=1.22.2.r3538.ce5544fdb0
pkgrel=1
pkgdesc='Reference frontend for the libretro API (Git-latest)'
arch=('i686' 'x86_64')
conflicts=('retroarch')
provides=('retroarch')
url='https://www.libretro.com/'
license=('GPL-3.0-only')
groups=('libretro')
depends=(
  alsa-lib
  dbus
  ffmpeg
  fontconfig
  fribidi
  gcc-libs
  glibc
  libass.so
  libdrm
  libfreetype.so
  libgl
  libpipewire
  libpulse
  libsixel
  libudev.so
  libusb
  libx11
  libxcb
  libxext
  libxinerama
  libxkbcommon
  libxrandr
  libxxf86vm
  libxv
  libxss
  mbedtls
  mesa
  openssl
  qt6-base
  sdl2
  v4l-utils
  wayland
  zlib
)

makedepends=(
  git
  libdecor
  vulkan-icd-loader
  wayland-protocols
)

install=$pkgname.install
optdepends=('gamemode: GameMode support'
            'libretro-overlays-git: Collection of overlays'
	          'libretro-shaders-all-git: Collection of shaders'
	          'retroarch-assets-xmb: XMB menu assets'
	          'retroarch-autoconfig-udev-git: udev joypad autoconfig (git latest)')
backup=('etc/retroarch.cfg')
source=('git+https://github.com/libretro/RetroArch.git')
sha256sums=('SKIP')

pkgver() {

  cd RetroArch
  printf "%s" "$(git describe --first-parent --long --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {

  cd RetroArch

  ./configure \
    --prefix=/usr \
    --enable-builtinmbedtls \
    --disable-cg \
    --disable-jack \
    --disable-oss \
    --enable-dbus \
    --enable-builtinsmbclient \
    --disable-smbclient

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
