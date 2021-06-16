# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=sdl2_sound-hg
pkgver=1.0.3.r275.85186703b413
pkgrel=1
pkgdesc="A library to decode several popular sound file formats (Version 2, development version)"
arch=('i686' 'x86_64')
url="http://icculus.org/SDL_sound/"
license=('zlib')
depends=('sdl2')
makedepends=('mercurial')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=(${pkgname%-*}::"hg+http://hg.icculus.org/icculus/SDL_sound")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  _lasttag=$(hg tags -q | sort -r | grep release- | head -n1)
  _commits=$(hg log --template "{node}\n" -r $_lasttag:tip | wc -l)
  _hash=$(hg identify -i | tr -cd [:alnum:])
  printf "%s.r%s.%s" "${_lasttag/release-}" "$_commits" "$_hash"
}

build() {
  rm -rf build
  cmake -Bbuild ${pkgname%-*} \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DSDLSOUND_BUILD_STATIC=FALSE \
    -DSDL2_INCLUDE_DIRS=/usr/include/SDL2 -DSDL2_LIBRARIES=/usr/lib/libSDL2.so
  cmake --build build
}

package() {
  DESTDIR="$pkgdir/" cmake --install build

  # handle conflict with sdl_sound
  mv "$pkgdir"/usr/bin/playsound{,-sdl2}

  # docs
  install -d "$pkgdir"/usr/share/doc/${pkgname%-*}
  install -Dm0644 ${pkgname%-*}/docs/* "$pkgdir"/usr/share/doc/${pkgname%-*}/

  # license
  install -Dm0644 ${pkgname%-*}/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname%-*}/LICENSE.txt
}
