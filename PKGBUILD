
# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2-minimal-hg
pkgver=2.0.9.r22.80f861112154
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('MIT')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'libxxf86vm')
makedepends=('alsa-lib' 'libxrandr' 'libxinerama' 'libxkbcommon' 'libxss' 'cmake' 'libxxf86vm' 'mercurial' 'ninja')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver'
            'fcitx: Asian language support'
            'ibus: Asian language support'
            'libibus: Asian language support'
            'tslib: Touchscreen support'
            'wayland: wayland support'
            'wayland-protocols: wayland support'
            'mesa: open source graphics support'
            'hidapi: modern controller support')
source=("hg+https://hg.libsdl.org/SDL#branch=default")
provides=(sdl2)
conflicts=(sdl2 sdl2-hg)
sha512sums=('SKIP')

pkgver() {

#Thanks Kozeid

  cd "SDL"
  printf "%s.r%s.%s" \
    "$(hg log -r . -T "{latesttag}" | sed 's/^release-//')" \
    "$(hg identify -n)" \
    "$(hg identify -i)"
}

prepare() {
  cd SDL

  sed -i "s/LIBUSB libusb/LIBUSB libusb-1.0/g" cmake/sdlchecks.cmake

  rm -rf build
  mkdir build
}

build() {
  cd SDL/build
  cmake .. \
      -Bbuild \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSDL_STATIC=OFF \
      -DSDL_DLOPEN=ON \
      -DARTS=OFF \
      -DARTS_SHARED=OFF \
      -DESD=OFF \
      -DESD_SHARED=OFF \
      -DNAS=OFF \
      -DNAS_SHARED=OFF \
      -DALSA=ON \
      -DOSS=OFF \
      -DHIDAPI=OFF \
      -DHIDAPI_LIBUSB=OFF \
      -DJOYSTICK=OFF \
      -DJOYSTICK_VIRTUAL=OFF \
      -DJOYSTICK_MFI=OFF \
      -DHAPTIC=OFF \
      -DSENSOR=OFF \
      -DSNDIO=OFF \
      -DSNDIO_SHARED=OFF \
      -DPULSEAUDIO=OFF \
      -DPULSEAUDIO_SHARED=OFF \
      -DVIDEO_WAYLAND=ON \
      -DVIDEO_WAYLAND_QT_TOUCH=OFF \
      -DVIDEO_X11_XSCRNSAVER=OFF \
      -DRPATH=OFF \
      -DCLOCK_GETTIME=ON \
      -DVIDEO_RPI=OFF \
      -DIBUS=OFF \
      -DFCITX=OFF \
      -DSSE=ON \
      -DSSE2=ON \
      -DSSE3=ON \
      -DSSEMATH=ON \
      -DVIDEO_X11_XSHAPE=OFF \
      -DJACK=OFF \
      -DJACK_SHARED=OFF
  ninja -C build
}

package() {
  cd SDL/build

  DESTDIR="${pkgdir}" ninja -C build install

  sed -i "s/libSDL2\.a/libSDL2main.a/g" "$pkgdir"/usr/lib/cmake/SDL2/SDL2Targets-noconfig.cmake

  install -Dm644 ../COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

#  ln -s /usr/lib/libSDL2-2.0.so ${pkgdir}/usr/lib/libSDL2-2.0.so.0
}

# vim: ts=2 sw=2 et:
