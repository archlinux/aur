# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: J0k3r <moebius282 at gmail dot com>

pkgname=lib32-sdl2-hg
pkgver=2.0.3.r528.3331d2f57704
pkgrel=1
pkgdesc="A library for portable low-level access to video, audio and input (Version 2, 32 bit, development version)"
arch=('x86_64')
url="http://www.libsdl.org"
license=('ZLIB')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
depends=('lib32-libxext' 'lib32-libxrender' 'lib32-libx11' 'lib32-libgl' 'lib32-libxcursor')
makedepends=('mercurial' 'cmake' 'gcc-multilib' 'lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' 'lib32-libxinerama'
	         'lib32-libxkbcommon' 'lib32-libxrandr')
optdepends=('lib32-alsa-lib: ALSA audio driver'
            'lib32-libpulse: PulseAudio audio driver')
source=("${pkgname%-*}"::"hg+http://hg.libsdl.org/SDL")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
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
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd build
  cmake ../"${pkgname%-*}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DARTS=OFF -DNAS=OFF -DESD=OFF -DSDL_STATIC=OFF -DRPATH=OFF -DVIDEO_WAYLAND=OFF
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install

  #already included in sdl2-hg
  rm -rf "$pkgdir"/usr/{share/aclocal,include,bin}

  install -Dm644 "${pkgname%-*}"/COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
