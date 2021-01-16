# Maintainer: TBD
# Contributor: Parker Reed <parker.l.reed@gmail.com>
# Contributor: prg <prg _at_ xannode.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Arkham, Christoph Zeiler, JD Steffen

pkgbase=amctc-git
pkgname=('amctc-git')
pkgver=r9402_9ee4224ed
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/cdoom64hunter/eduke32-amcfork-revised"
license=('GPL' 'custom: BUILD')
depends=('sdl2_mixer' 'libvpx' 'gtk2')
makedepends=('git' 'gendesk' 'glu')
makedepends_i686=('nasm')
optdepends=('timidity-freepats: a free soundfont for music'
            'fluidsynth: alternative midi sequencer'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
source=("$pkgbase::git+https://github.com/cdoom64hunter/eduke32-amcfork-revised.git#branch=amc_dev"
        "amctc.png")
sha256sums=('SKIP'
            '899dd4fdd84e2dba998b4cf19228fff82967106eea58ce9fcb99836d49310256')
amctc_pkgdesc="Advanced Duke Nukem 3D source port with support for amctc - git version"


pkgver() {
  cd $pkgbase
  echo "r$(git rev-list HEAD --count)_$(git rev-parse HEAD | cut -c 1-9)"
}

prepare() {
  gendesk -f -n --pkgname=${pkgbase/-git} --pkgdesc="${amctc_pkgdesc/ -*}" \
    --name=amctc --genericname="${amctc_pkgdesc/ -*}" --comment="$amctc_pkgdesc" \
    --categories="Game;ActionGame"
}

build() {
  cd $pkgbase
  make debug="$CFLAGS" SDL_TARGET=2
}

package_amctc-git() {
pkgdesc=$amctc_pkgdesc
provides=('amctc' 'amctc-git')
conflicts=('amctc' 'amctc-git')
install=$pkgbase.install
  cd $pkgbase
  install -d "$pkgdir"/usr/bin
  install -m755 amctc mapster32 "$pkgdir"/usr/bin
  mv "$pkgdir"/usr/bin/mapster32 "$pkgdir"/usr/bin/amctc-mapster32
  install -Dm644 package/common/buildlic.txt "$pkgdir"/usr/share/licenses/amctc/buildlic.txt
  install -Dm644 ../amctc.png "$pkgdir"/usr/share/pixmaps/amctc.png
  install -Dm644 ../amctc.desktop "$pkgdir"/usr/share/applications/amctc.desktop
}
