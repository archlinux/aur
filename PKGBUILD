# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Arkham, Christoph Zeiler, JD Steffen

pkgname=eduke32-svn
pkgver=r6789
pkgrel=1
pkgdesc="Advanced Duke Nukem 3D source port - svn version"
arch=('i686' 'x86_64')
url="http://eduke32.com"
license=('GPL' 'custom: BUILD')
depends=('sdl2_mixer' 'libvpx' 'gtk2')
makedepends=('subversion' 'gendesk' 'glu')
makedepends_i686=('nasm')
optdepends=('timidity-freepats: a free soundfont for music'
            'fluidsynth: alternative midi sequencer'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
conflicts=('eduke32')
provides=('eduke32')
install=$pkgname.install
source=("eduke32-svn::svn+http://svn.eduke32.com/eduke32"
        "eduke32.png")
sha256sums=('SKIP'
            'b55a264b4682afabd49587d700d4c85ce6c2e7af7ce2764dd217ebe167549863')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  gendesk -f -n --pkgname=${pkgname/-svn} --pkgdesc="${pkgdesc/ -*}" \
    --name=EDuke32 --categories="Application;Game"
}

build() {
  cd $pkgname
  make debug="$CFLAGS" SDL_TARGET=2 VC_REV=${pkgver/r}
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/bin
  install -m755 eduke32 mapster32 "$pkgdir"/usr/bin
  install -Dm644 package/common/buildlic.txt "$pkgdir"/usr/share/licenses/$pkgname/buildlic.txt
  install -Dm644 ../eduke32.png "$pkgdir"/usr/share/pixmaps/eduke32.png
  install -Dm644 ../eduke32.desktop "$pkgdir"/usr/share/applications/eduke32.desktop
}
