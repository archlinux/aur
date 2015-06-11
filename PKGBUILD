# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=opentyrian-hg
pkgver=1091
pkgrel=1
pkgdesc="Port of the classic DOS game Tyrian"
url="https://bitbucket.org/opentyrian/opentyrian/wiki/Home"
arch=(i686 x86_64)
license=(GPL3 GPL2)
depends=(sdl sdl_net gtk-update-icon-cache)
makedepends=(mercurial)
provides=(tyrian opentyrian)
conflicts=(opentyrian)
replaces=(opentyrian-svn)
install=opentyrian.install
source=(opentyrian::hg+https://bitbucket.org/opentyrian/opentyrian
        http://www.camanis.net/opentyrian/tyrian21.zip)
md5sums=('SKIP'
         '2a3b206a6de25ed4b771af073f8ca904')

pkgver() {
  cd opentyrian
  hg id -n
}

package() {
  cd opentyrian
  make DESTDIR="$pkgdir" prefix=/usr install \
    CPPFLAGS="-DNDEBUG $CPPFLAGS" \
    CFLAGS="-pedantic -MMD $CFLAGS" \
    LDFLAGS="$LDFLAGS"

  install -Dm644 linux/opentyrian.desktop "$pkgdir/usr/share/applications/opentyrian.desktop"
  for _x in 22 24 32 48 128; do
    install -D -m644 "linux/icons/tyrian-$_x.png" \
      "$pkgdir/usr/share/icons/hicolor/${_x}x${_x}/apps/opentyrian.png"
  done

  cd ../tyrian21
  mkdir -p "$pkgdir/usr/share/games/tyrian"
  for _x in *.dat *.lvl *.shp *.snd demo.* music.mus tyrend.anm tyrian.{cdt,hdt,pic} tshp2.pcx; do
    install -m644 "$_x" "$pkgdir/usr/share/games/tyrian"
  done
}
