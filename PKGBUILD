# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2-hg
pkgver=2.0.12
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('MIT')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'libibus' 'hidapi' 'libxxf86vm')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'fcitx' 'libxss' 'cmake' 'jack' 'ninja' 'mercurial' 'libxxf86vm')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=("hg+https://hg.libsdl.org/SDL#branch=default")
provides=(sdl2)
conflicts=(sdl2 sdl2-minimal-hg)
sha512sums=('SKIP')

pkgver() {

#thanks Kozeid

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
      -DESD=OFF \
      -DNAS=OFF \
      -DALSA=ON \
      -DHIDAPI=ON \
      -DPULSEAUDIO_SHARED=ON \
      -DVIDEO_WAYLAND=ON \
      -DRPATH=OFF \
      -DCLOCK_GETTIME=ON \
      -DJACK_SHARED=ON
  ninja $NINJAFLAGS -C build
}

package() {
  cd SDL/build

  mkdir -p ${pkgdir}/usr/lib
  ln -s /usr/lib/libSDL2-2.0.so ${pkgdir}/usr/lib/libSDL2-2.0.so.0

  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C build install

  sed -i "s/libSDL2\.a/libSDL2main.a/g" "$pkgdir"/usr/lib/cmake/SDL2/SDL2Targets-noconfig.cmake

  install -Dm644 ../COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

#  ln -s /usr/lib/libSDL2-2.0.so ${pkgdir}/usr/lib/libSDL2-2.0.so.0
}

# vim: ts=2 sw=2 et:
