# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: JD Steffen

pkgname=eduke32
pkgver=20140101_4240
pkgrel=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('i686' 'x86_64')
url="http://eduke32.com/"
license=('GPL' 'custom: BUILD')
depends=('sdl_mixer' 'libgl' 'libvpx' 'flac' 'gtk2')
makedepends=('mesa' 'glu')
# nasm is x86-only
[ "$CARCH" == "i686" ] && makedepends=(${makedepends[@]} 'nasm')
optdepends=('eduke32-hrp: High Resolution Pack'
            'eduke32-dukeplus: Enhanced Mod'
            'timidity-freepats: free soundfont for music'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
conflicts=('eduke32-svn')
install="$pkgname.install"
source=("http://dukeworld.duke4.net/$pkgname/synthesis/${pkgver//_/-}/${pkgname}_src_${pkgver//_/-}.tar.xz"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('c91a01ae0291bcfe5b4259af3fa93934da1ae5466ca4a9d592e07c075689b4ce'
            'b55a264b4682afabd49587d700d4c85ce6c2e7af7ce2764dd217ebe167549863'
            '9224aadf634448726d2e863ba9a455887dc3b90049238fe592b7f7b5634cbd79')

build() {
  cd ${pkgname}_${pkgver//_/-}

  # add our makeflags and explicitly disable c++ building with sdl 1.2
  make debug="${CXXFLAGS}" CPLUSPLUS=0 SDL_TARGET=1
}

package() {
  cd ${pkgname}_${pkgver//_/-}

  # install binaries, buildlicense, icon and desktop files
  install -d "$pkgdir"/usr/bin
  install -m755 eduke32 mapster32 "$pkgdir"/usr/bin
  install -Dm644 package/common/buildlic.txt "$pkgdir"/usr/share/licenses/$pkgname/buildlic.txt
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
