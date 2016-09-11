# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# This package tracks the latest source code on GitHub
# Clone specific tags:

# Cloning specific tags:
#source=("git+https://github.com/libretro/RetroArch.git#tag=v${pkgver}"
#        'git+https://github.com/KhronosGroup/glslang.git#commit=a4a4d5e'
#        'git+https://github.com/KhronosGroup/SPIRV-Cross.git#commit=5c24d99')

pkgname=retroarch-git
pkgver=1.3.6.r1074.aab5fe6
pkgrel=1
#epoch=1
git_name=RetroArch
pkgdesc='Reference frontend for the libretro API (Git-latest)'
arch=('i686' 'x86_64')
conflicts=('retroarch')
provides=('retroarch')
url='http://www.libretro.com/'
license=('GPL')
groups=('libretro')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libdrm' 'libgl' 'libpulse' 'libusb'
         'libx11' 'libxcb' 'libxext' 'libxinerama' 'libxkbcommon' 'libxv'
         'libxxf86vm' 'mesa' 'openal' 'sdl2' 'wayland' 'zlib'
         'libass.so' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
         'libfreetype.so' 'libswresample.so' 'libswscale.so' 'libudev.so')
makedepends=('git' 'vulkan-icd-loader')
optdepends=('libretro-desmume: Nintendo DS core'
            'libretro-gambatte: Nintendo Game Boy/Game Boy Color core'
            'libretro-genesis-plus: Sega Master System/Genesis/Game Gear/CD/32X core'
            'libretro-mgba: Nintendo Game Boy Advance core'
            'libretro-mupen64plus: Nintendo 64 core'
            'libretro-nestopia: Nintendo Entertainment System core'
            'libretro-pcsx-rearmed: Sony PlayStation core'
            'libretro-reicast: Sega Dreamcast core'
            'libretro-snes9x: Super Nintendo Entertainment System core'
            'libretro-yabause: Sega Saturn core'
            'libretro-overlays: Collection of overlays'
            'libretro-shaders: Collection of shaders'
            'retroarch-assets-xmb: XMB menu assets'
            'retroarch-autoconfig-udev: udev joypad autoconfig'
	    'xdg-utils-git')
backup=('etc/retroarch.cfg')
source=('git+https://github.com/libretro/RetroArch.git'
        'git+https://github.com/KhronosGroup/glslang.git'
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {

  cd RetroArch
  printf "%s" "$(git describe --first-parent --long --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"

}

prepare() {

  cd RetroArch

  git submodule init deps/{glslang/glslang,SPIRV-Cross}
  git config submodule.glslang.url ../glslang
  git config submodule.SPIRV-Cross.url ../SPIRV-Cross
  git submodule update deps/{glslang/glslang,SPIRV-Cross}

}

build() {

  cd RetroArch
  ./configure \
    --prefix='/usr' \
    --disable-cg \
    --disable-jack \
    --disable-oss
  make
  make -C gfx/video_filters
  make -C audio/audio_filters

}

package() {

  cd RetroArch

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/lib/retroarch/filters/{audio,video}
  install -m 644 gfx/video_filters/*.{filt,so} "${pkgdir}"/usr/lib/retroarch/filters/video/
  install -m 644 audio/audio_filters/*.{dsp,so} "${pkgdir}"/usr/lib/retroarch/filters/audio/

}

# vim: ts=2 sw=2 et:
