# Maintainer: Konstantin Rannev <konstantin.rannev@gmail.com>

pkgname=netduke32
pkgver=1.2.1
pkgrel=1
pkgdesc="An advanced Duke Nukem 3D source port with improved multiplayer functionality"
arch=('x86_64')
url="https://voidpoint.io/StrikerTheHedgefox/eduke32-csrefactor"
license=('GPL-2.0-or-later')
depends=('libvpx' 'sdl2' 'flac' 'libvorbis' 'alsa-lib')
makedepends=('mesa' 'glu' 'git')
optdepends=('freepats-general-midi: a free soundfont for music'
            'fluidsynth: alternative midi sequencer'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
install=${pkgname}.install
source=("${pkgname}::git+https://voidpoint.io/StrikerTheHedgefox/eduke32-csrefactor.git#tag=NetDuke32_v${pkgver}"
        "${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=('4347a3dba92502b7e9e0c775226501ab974b7f92153b7660cacf03b6f179595e'
            '1654ddd36ec513ceb91adac09ecd5986f176612384d897b58cf70385a96882a3'
            'dcd83d9b403cc5fa51a4bd8848c8341009aac0ed1b97b2ed504be2f870e4bbee')

prepare() {
  cd "$srcdir/${pkgname}"

  # fix the == operator bug in libdivide
  sed -i 's|\(return div\.denom\.magic == other\)\.denom\.magic|\1.div\.denom.magic|' \
         source/build/include/libdivide.h
  sed -i 's|\(div\.denom\.more == other\)\.denom\.more|\1.div\.denom.more|' \
         source/build/include/libdivide.h
}
 
build() {
  cd "$srcdir/${pkgname}"

  # obtain the SHA of the tag we're checking out
  local rev=$(git rev-parse --short HEAD)

  # add cxxflags, set revision
  make PACKAGE_REPOSITORY=1 VC_REV="$rev" netduke32 #PRETTY_OUTPUT=0
}

package() {
  cd "$srcdir/${pkgname}"

  # install binaries, license, icon and desktop files
  install -d "$pkgdir"/usr/bin
  install -m755 netduke32 "$pkgdir"/usr/bin/netduke32
  install -Dm644 ../${pkgname}.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png
  install -Dm644 ../${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
}
