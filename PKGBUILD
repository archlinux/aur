# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: arjan <arjan@archlinux.org>

pkgname=allegro-sdl-git
pkgver=r11630.ce68911b4
pkgrel=1
pkgdesc='Portable library mainly aimed at video game and multimedia programming'
arch=(x86_64)
url='https://liballeg.org/'
license=(custom)
makedepends=(cmake glu libtheora mesa-libgl opusfile pandoc)
depends=(dumb libgl libtheora libwebp libxpm opusfile physfs sdl2)
provides=("${pkgname%-sdl-git}")
conflicts=("${pkgname%-sdl-git}")
source=("git+https://github.com/liballeg/allegro5.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/allegro5"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build
  cmake ../allegro5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DALLEGRO_SDL=ON \
    -DWANT_DOCS_HTML=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/allegro5/LICENSE.txt -t "$pkgdir"/usr/share/licenses/allegro

  # Fix man path
  mv -v -f "$pkgdir/usr/man" "$pkgdir/usr/share/man"
}
