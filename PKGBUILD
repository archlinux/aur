# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2_ttf-hg
pkgver=2.0.15
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_ttf"
license=('MIT')
depends=('sdl2' 'freetype2')
makedepends=('cmake' 'mercurial')
provides=(sdl2_ttf)
conflicts=(sdl2_ttf)
source=(hg+https://hg.libsdl.org/SDL_ttf/)
sha512sums=('SKIP')

pkgver() {
  cd SDL_ttf

  local _lasttag=$(hg tags -q | sort -r | grep release- | head -n1)
  local _commits=$(hg log --template "{node}\n" -r $_lasttag:tip | wc -l)
  printf "%s.r%s.%s" "${_lasttag/release-}" "$_commits" "$(hg identify -i)"
}


prepare() {
  cd SDL_ttf

  touch NEWS README AUTHORS ChangeLog
  autoreconf -vi
}

build() {
  cd SDL_ttf

  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd SDL_ttf

  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

