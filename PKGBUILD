# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Baptiste Jonglez <baptiste@jonglez.org>
# Contributor: Serge Ziryukin <ftrvxmtrx@gmail.com>
# Contributor: loqs

pkgname=asciiportal
pkgver=1.3.8
pkgrel=5
pkgdesc='Text based puzzle game inspired by the popular video game'
arch=(x86_64)
url='https://github.com/cymonsgames/ASCIIpOrtal'
license=(custom GPL3)
depends=(pdcurses sdl_mixer yaml-cpp)
makedepends=(gendesk git imagemagick setconf)
source=("git+https://github.com/cymonsgames/ASCIIpOrtal.git#tag=v${pkgver%.8}-beta${pkgver#*.*.}"
        "$pkgname.png::https://fc01.deviantart.net/fs71/f/2010/318/3/5/portal_ascii_icon___button_by_lightmystic-d32udqx.png")
b2sums=('SKIP'
        'a09312f58b14e21a5c978afac5bb15e44b101c21355e67d8bcae785b7706e566cf984423a32f6be03e912f54a623953d761e9241529e3a1bc6fcd95428869767')

prepare() {
  gendesk -n -f \
    --name ASCIIpOrtal \
    --pkgname $pkgname \
    --pkgdesc "$pkgdesc" \
    --exec $pkgname
  convert \
    +set date:create +set date:modify \
    $pkgname.png \
    -resize 48x48\! \
    ${pkgname}48x48.png
  setconf \
    ASCIIpOrtal/Makefile.linux \
    CXXFLAGS="$CXXFLAGS -I/usr/include/xcurses $(pkg-config sdl --cflags) $(pkg-config SDL_mixer --cflags) -U__NOSDL__ -U__NOSOUND__ -U__DINGOO__ -U__GP2X__ -O0 -w"
  setconf \
    ASCIIpOrtal/Makefile.linux \
    LINKFLAGS="\$(LINKFLAGS) \$(LDFLAGS) -L/usr/lib $(pkg-config sdl --libs) $(pkg-config SDL_mixer --libs) -lpdcurses"
  echo 'The ASCIIportal icon is drawn by Matt White and licensed under a CC license' > icon.txt
}

build() {
  make -C ASCIIpOrtal linux
}

package() {
  make -C ASCIIpOrtal DESTDIR="$pkgdir" install
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ${pkgname}48x48.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 icon.txt "$pkgdir/usr/share/licenses/$pkgname/icon.txt"
}
