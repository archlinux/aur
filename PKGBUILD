# Maintainer: That One Seong <ThatOneSeong@protonmail.com>
# Contributor: Parker Reed <parker.l.reed@gmail.com>

pkgname=retroarch-gun-git
pkgver=1.21.0.r52.13616bafe0
pkgrel=1
_gitname=RetroArch
pkgdesc='Reference frontend for the libretro API (Git-latest, with input sorting patches from Batocera)'
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
         'libfreetype.so' 'libswresample.so' 'libswscale.so' 'libudev.so'
         'nvidia-cg-toolkit' 'perl-net-dbus')
makedepends=('git' 'vulkan-icd-loader')
optdepends=('libretro-overlays-git: Collection of overlays'
	    'libretro-shaders-all-git: Collection of shaders'
	    'retroarch-assets-xmb: XMB menu assets'
	    'retroarch-autoconfig-udev-git: udev joypad autoconfig (git latest)'
	    'xdg-utils-git: Includes updated screensaver suspend fixes'
	    'qt5-base: For the new WIMP interface')
backup=('etc/retroarch.cfg')
source=('git+https://github.com/libretro/RetroArch.git'
        'git+https://github.com/KhronosGroup/glslang.git'
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {

  cd "$srcdir/$_gitname"
  printf "%s" "$(git describe --first-parent --long --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"

}

prepare() {

  # filtering out batocera's repo to only clone the patches and avoid downloading the whole distro
  git clone -n --depth=1 --filter=tree:0 https://github.com/batocera-linux/batocera.linux
  cd "$srcdir/batocera.linux"
  git sparse-checkout set --no-cone /package/batocera/emulators/retroarch/retroarch
  git checkout

  # setup retroarch deps
  cd "$srcdir/$_gitname"
  git submodule init deps/{glslang/glslang,SPIRV-Cross}
  git config submodule.glslang.url ../glslang
  git config submodule.SPIRV-Cross.url ../SPIRV-Cross
  git submodule update deps/{glslang/glslang,SPIRV-Cross}

  # apply batocera's input sorting patch
  patch -p1 < "$srcdir/batocera.linux/package/batocera/emulators/retroarch/retroarch/014-input_sort_devices.patch"

}

build() {

  cd "$srcdir/$_gitname"

  ./configure \
    --prefix='/usr' \
    --disable-jack \
    --disable-oss 
  make clean
  make
  make -C gfx/video_filters

}

package() {

  cd "$srcdir/$_gitname"

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/lib/retroarch/filters/{audio,video}
  install -m 644 gfx/video_filters/*.{filt,so} "${pkgdir}"/usr/lib/retroarch/filters/video/

}

# vim: ts=2 sw=2 et:
