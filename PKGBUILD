# Contributor: Lari Tikkanen <lartza@wippies.com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=teeworlds-git
pkgver=0.7.3.4706.65c1d46f5
pkgrel=1
pkgdesc='Multiplayer 2D shooter'
arch=('x86_64')
url="https://teeworlds.com"
license=('custom')
depends=('alsa-lib' 'glu' 'mesa' 'gcc-libs' 'sdl2' 'freetype2')
makedepends=('python' 'git' 'bam' 'imagemagick')
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
  cd teeworlds
  bam client server
}

package() {
  cd teeworlds
  
  install -dm755 "$pkgdir"/usr/bin \
                 "$pkgdir"/usr/share/{applications,metainfo} \
                 "$pkgdir"/usr/share/{licenses/teeworlds,teeworlds/data}
  
   # Install data files
  cp -r datasrc/* "$pkgdir"/usr/share/teeworlds/data

  install -m755 build/$CARCH/debug/teeworlds     "$pkgdir"/usr/bin/
  install -m755 build/$CARCH/debug/teeworlds_srv "$pkgdir"/usr/bin/

  install -m644 license.txt                   "$pkgdir/usr/share/licenses/teeworlds/"
  install -m644 other/teeworlds.appdata.xml   "$pkgdir/usr/share/metainfo/"
  install -m644 other/teeworlds.desktop       "$pkgdir/usr/share/applications/"

   # Install client and server icon files according to the image size
  for num in 0 1 2 3 4 5; do
    _s=$(file "$srcdir/teeworlds-$num.png" | cut -d' ' -f5)
    [[ $_s == ?(-)+([0-9]) ]]  # is it a number?
    _s=${_s}x${_s}
    install -Dm644 "$srcdir/teeworlds-$num.png" \
        "$pkgdir/usr/share/icons/hicolor/$_s/apps/teeworlds.png"
  done
}
