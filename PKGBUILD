# Original archlinux' sdl2 package Maintainer: Sven-Hendrik Haase 
# Raspberry Pi package Maintainer: Luiz Silveira (zertyz @ gmail)

pkgname=sdl2-rpi
pkgver=2.0.14
pkgrel=1
pkgdesc="SDL2 using the accelerated broadcom driver for Raspbery Pi 0, 1, 2 & 3 - fullscreen without X. Also suports the opensource vc4-(f)kms-v3d driver in both standalone mode and in X11."
arch=('armv6h' 'armv7h' 'armv8h')
url="https://www.libsdl.org"
license=('MIT')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'libibus')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'fcitx' 'libxss' 'cmake' 'jack')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
conflicts=('sdl2')
provides=('sdl2')
source=("https://www.libsdl.org/release/SDL2-${pkgver}.tar.gz")
sha512sums=('ebc482585bd565bf3003fbcedd91058b2183e333b9ea566d2f386da0298ff970645d9d25c1aa4459c7c96e9ea839fd1c5f2da0242a56892865b2e456cdd027ee')

prepare() {
  cd SDL2-${pkgver}

  mkdir build
}

build() {
  cd SDL2-${pkgver}/build
  PKG_CONFIG_PATH=/opt/vc/lib/pkgconfig LDFLAGS=-pthread cmake -DVIDEO_RPI=ON -DCMAKE_BUILD_TYPE=Release cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSDL_STATIC=OFF \
      -DSDL_DLOPEN=ON \
      -DARTS=OFF \
      -DESD=OFF \
      -DNAS=OFF \
      -DALSA=ON \
      -DPULSEAUDIO_SHARED=ON \
      -DVIDEO_WAYLAND=ON \
      -DRPATH=OFF \
      -DCLOCK_GETTIME=ON \
      -DJACK_SHARED=ON
  make
}

package() {
  cd SDL2-${pkgver}/build

  make DESTDIR="${pkgdir}" install

  sed -i "s/libSDL2\.a/libSDL2main.a/g" "$pkgdir"/usr/lib/cmake/SDL2/SDL2Targets-release.cmake

  install -Dm644 ../COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
