# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Contributor: prg <prg _at_ xannode.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Arkham, Christoph Zeiler, JD Steffen

pkgbase=eduke32-git
pkgname=('eduke32-git' 'voidsw-git')
pkgver=r9142_e3946bf81
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="http://eduke32.com"
license=('GPL' 'custom: BUILD')
depends=('sdl2_mixer' 'libvpx' 'gtk2')
makedepends=('git' 'gendesk' 'glu')
makedepends_i686=('nasm')
optdepends=('timidity-freepats: a free soundfont for music'
            'fluidsynth: alternative midi sequencer'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
source=("$pkgbase::git+https://voidpoint.io/terminx/eduke32"
        "eduke32.png")
sha256sums=('SKIP'
            'b55a264b4682afabd49587d700d4c85ce6c2e7af7ce2764dd217ebe167549863')
duke_pkgdesc="Advanced Duke Nukem 3D source port - git version"
voidsw_pkgdesc="Advanced Shadow Warrior source port - git version"

pkgver() {
  cd $pkgbase
  echo "r$(git rev-list HEAD --count)_$(git rev-parse HEAD | cut -c 1-9)"
}

prepare() {
  gendesk -f -n --pkgname=${pkgbase/-git} --pkgdesc="${duke_pkgdesc/ -*}" \
    --name=EDuke32 --genericname="${duke_pkgdesc/ -*}" --comment="$duke_pkgdesc" \
    --categories="Game;ActionGame"
  gendesk -f -n --pkgname=voidsw --pkgdesc="${voidsw_pkgdesc/ -*}" \
    --name=VoidSW --genericname="${voidsw_pkgdesc/ -*}" --comment="$voidsw_pkgdesc" \
    --categories="Game;ActionGame"
}

build() {
  cd $pkgbase
  make debug="$CFLAGS" SDL_TARGET=2 VC_REV=${pkgver/r}
  make voidsw
}

package_eduke32-git() {
pkgdesc=$duke_pkgdesc
provides=('eduke32' 'eduke32-svn')
conflicts=('eduke32' 'eduke32-svn')
install=$pkgbase.install
  cd $pkgbase
  install -d "$pkgdir"/usr/bin
  install -m755 eduke32 mapster32 "$pkgdir"/usr/bin
  install -Dm644 package/common/buildlic.txt "$pkgdir"/usr/share/licenses/eduke32/buildlic.txt
  install -Dm644 ../eduke32.png "$pkgdir"/usr/share/pixmaps/eduke32.png
  install -Dm644 ../eduke32.desktop "$pkgdir"/usr/share/applications/eduke32.desktop
}

package_voidsw-git() {
provides=('voidsw')
conflicts=('voidsw')
install=voidsw-git.install
pkgdesc=$voidsw_pkgdesc
  cd $pkgbase
  install -d "$pkgdir"/usr/bin
  install -m755 voidsw "$pkgdir"/usr/bin
  install -Dm644 package/common/buildlic.txt "$pkgdir"/usr/share/licenses/voidsw/buildlic.txt
  install -Dm644 ../voidsw.desktop "$pkgdir"/usr/share/applications/voidsw.desktop
}
