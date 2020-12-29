# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2_image-minimal-hg
pkgver=2.0.5
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL surfaces (Version 2)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_image"
license=('MIT')
depends=('sdl2' 'libpng' 'libtiff' 'libjpeg')
makedepends=('cmake' 'mercurial')
provides=(sdl2_image)
conflicts=(sdl2_image)
source=(hg+https://hg.libsdl.org/SDL_image/)
sha512sums=('SKIP')

pkgver() {
  cd SDL_image

  local _lasttag=$(hg tags -q | sort -r | grep release- | head -n1)
  local _commits=$(hg log --template "{node}\n" -r $_lasttag:tip | wc -l)
  printf "%s.r%s.%s" "${_lasttag/release-}" "$_commits" "$(hg identify -i)"
}


build() {
  cd SDL_image

  ./autogen.sh
  ./configure --disable-static --prefix=/usr \
    --disable-jpg-shared \
    --disable-png-shared \
    --disable-tif-shared \
    --disable-webp-shared \
    --disable-webp \
    --disable-webpdec
  make
}

package() {
  cd SDL_image

  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
