# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Baptiste Jonglez <baptiste@jonglez.org>
# Contributor: Serge Ziryukin <ftrvxmtrx@gmail.com>
# Contributor: loqs

pkgname=asciiportal
pkgver=1.3.8
pkgrel=7
pkgdesc='Text based puzzle game inspired by the popular video game'
arch=(x86_64)
url='https://github.com/cymonsgames/ASCIIpOrtal'
license=(custom GPL3)
depends=(pdcurses sdl_mixer yaml-cpp)
makedepends=(gendesk git imagemagick setconf)
source=("git+https://github.com/cymonsgames/ASCIIpOrtal.git#tag=v${pkgver%.8}-beta${pkgver#*.*.}"
        "$pkgname.png::https://fc01.deviantart.net/fs71/f/2010/318/3/5/portal_ascii_icon___button_by_lightmystic-d32udqx.png"
	"patch1.patch::https://github.com/cymonsgames/ASCIIpOrtal/commit/f0157d8c01252ebcdd238ea2c42b3cce4531bac3.diff"
	"patch2.patch::https://github.com/cymonsgames/ASCIIpOrtal/commit/7817f5c10b715ad44161fff998367aa449591d16.diff")

sha256sums=('SKIP'
            '390f21881377b331f1a65a3e54ccf91fba72a88146058cc146f914a1185de9d1'
            'dd8278ea45ff848a51bf66a577657ffaa7c3875316e7a0770a08b691c308606f'
            '8c3e334b3022f74ba46e3f5d85d0d375f5c7e5e5c2c17cae16fa36d98bcbd79e')

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

  cd ASCIIpOrtal
  git apply  ../../patch1.patch
  git apply ../../patch2.patch
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
