# Contributor: Lari Tikkanen <lartza@wippies.com>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-git
pkgver=0.7.start.480.g19e3433
pkgrel=1
pkgdesc='Multiplayer 2D shooter'
arch=('i686' 'x86_64')
url="http://teeworlds.com"
license=('custom')
depends=('alsa-lib' 'glu' 'mesa' 'gcc-libs' 'sdl' 'freetype2')
makedepends=('python' 'git' 'bam' 'imagemagick' 'gendesk')
provides=('teeworlds')
conflicts=('teeworlds')
source=(git+https://github.com/teeworlds/teeworlds.git
        git+https://github.com/teeworlds/teeworlds-translation.git
        git+https://github.com/teeworlds/teeworlds-maps.git)
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd teeworlds
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
  convert "teeworlds/other/icons/Teeworlds.ico" "$srcdir/teeworlds.png"
  gendesk -n --pkgname "teeworlds" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'
    
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
                 "$pkgdir"/usr/share/{applications,pixmaps} \
                 "$pkgdir"/usr/share/{licenses/teeworlds,teeworlds/data}
  
   # Install data files
  cp -r data/* "$pkgdir"/usr/share/teeworlds/data

  install -m755 build/$CARCH/debug/teeworlds "$pkgdir"/usr/bin/teeworlds
  install -m755 build/$CARCH/debug/teeworlds_srv "$pkgdir"/usr/bin/teeworlds_srv

  install -m644 license.txt "$pkgdir"/usr/share/licenses/teeworlds/
  install -m644 ../teeworlds.desktop "$pkgdir"/usr/share/applications/
  install -m644 ../teeworlds-0.png "$pkgdir"/usr/share/pixmaps/teeworlds.png

}
