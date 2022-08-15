# Contributor: Lari Tikkanen <lartza@wippies.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=teeworlds-git
pkgver=0.7.5.6245.26d24ec06
pkgrel=1
pkgdesc='Fast-paced multiplayer 2D shooter game'
arch=('x86_64')
url="https://teeworlds.com"
license=('custom' 'CCPL:by-nc-sa')
depends=('alsa-lib' 'glu' 'sdl2' 'freetype2' 'pnglite' 'wavpack' 'openssl')
makedepends=('python' 'git' 'cmake' 'ninja' 'imagemagick' 'gtest')
provides=('teeworlds')
conflicts=('teeworlds')
source=('git+https://github.com/teeworlds/teeworlds.git'
        'git+https://github.com/teeworlds/teeworlds-translation.git'
        'git+https://github.com/teeworlds/teeworlds-maps.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd teeworlds
  v=$(grep "GAME_VERSION " src/game/version.h | cut -d\" -f2)
  printf "$v.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  convert "teeworlds/other/icons/teeworlds.ico" "$srcdir/teeworlds.png"

  cd teeworlds
  git submodule init
  git config submodule.data/languages.url "$srcdir/teeworlds-translation"
  git config submodule.data/maps.url "$srcdir/teeworlds-maps"
  git submodule update
}

build() {
  mkdir -p build
  cd build
  cmake ../teeworlds \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -GNinja
  ninja
}

check() {
  ninja run_tests -C build
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
  
  install -dm755 "$pkgdir/usr/share/"{licenses/$pkgname,metainfo,applications}
  install -m644 teeworlds/license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 teeworlds/other/teeworlds.appdata.xml -t "$pkgdir/usr/share/metainfo/"
  install -m644 teeworlds/other/teeworlds.desktop -t "$pkgdir/usr/share/applications/"

   # Install client and server icon files according to the image size
  for _icon in $(ls -1 "$srcdir"/teeworlds-*.png); do
    _s=$(identify $_icon | awk '{print $3}')
    [[ $_s =~ ([0-9])+x([0-9])+ ]] || ( echo "Not a NUMxNUM: '$_s'"; exit 1; )
    install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/$_s/apps/teeworlds.png"
  done
}
