# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Daniel Kirchner <daniel at ekpyron dot rog>
# Contributor: Gustavo Alvarez <sl1pkn07 at gmail dot com>
# Contributor: Chase Geigle <sky at skystrife dot com>
# Contributor: Axper Jan <483ken at gmail dot com>

pkgname=sdl2-hg
pkgver=2.0.4.r3.d91a2c45825e
pkgrel=1
pkgdesc="A library for portable low-level access to video, audio and input (Version 2, development version)"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('ZLIB')
provides=('sdl2')
conflicts=('sdl2')
depends=('sh' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor')
makedepends=('mercurial' 'cmake' 'alsa-lib' 'mesa' 'libpulse' 'libxinerama' 'libxkbcommon' 'libxrandr')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
source=(sdl2::"hg+http://hg.libsdl.org/SDL")
md5sums=('SKIP')

pkgver() {
  cd sdl2
  _tag=$(hg tags -q | sort -r | grep release- | head -n1)
  _commits=$(hg log --template "{node}\n" -r $_tag:tip | wc -l)
  echo "${_tag/release-}.r$_commits.$(hg identify -i)"
}

prepare() {
  # reset build folder
  rm -rf build
  mkdir build
}

build() {
  cd build

  cmake ../sdl2 -DCMAKE_INSTALL_PREFIX=/usr \
    -DARTS=OFF -DNAS=OFF -DESD=OFF -DRPATH=OFF -DVIDEO_WAYLAND=OFF \
    -DSDL_STATIC=OFF # -DSDL_DLOPEN=ON -DSDL_SHARED=ON
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install

  install -Dm644 sdl2/COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
