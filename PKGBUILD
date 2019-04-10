
# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2-hidpi-hg
pkgver=2.0.9.r12701+.3477a301a5a8+
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) (with hidpi support on Wayland)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('MIT')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'libibus')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'fcitx' 'libxss' 'cmake' 'jack')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=("hg+http://hg.libsdl.org/SDL#branch=default"
        "0006-wayland-HiDPI-support.patch")
provides=(sdl2)
conflicts=(sdl2)
sha512sums=('SKIP'
            'SKIP')

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

  rm -rf build
  mkdir build
  patch -p1 < ../0006-wayland-HiDPI-support.patch
}

build() {
  cd SDL/build
  cmake .. \
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
  cd SDL/build

  make DESTDIR="${pkgdir}" install

  sed -i "s/libSDL2\.a/libSDL2main.a/g" "$pkgdir"/usr/lib/cmake/SDL2/SDL2Targets-noconfig.cmake

  install -Dm644 ../COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
