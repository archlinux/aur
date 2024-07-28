# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin, Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2'
pkgver=8.40
pkgrel=1
pkgdesc='Enhanced Quake II engine optimized for modern systems'
url='https://www.yamagi.org/quake2/'
arch=('i686' 'x86_64' 'aarch64')
license=('custom: Info-ZIP' 'GPL-2.0')
depends=('sdl2')
optdepends=('curl: http download support'
            'openal: alternative audio backend'
            'quake2-data: game files'
            'quake2-demo: shareware data files')
makedepends=('openal' 'mesa' 'curl')
install="${pkgname}.install"
source=("https://deponie.yamagi.org/quake2/quake2-${pkgver}.tar.xz"
        "${pkgname}.desktop")
sha512sums=('4e37b1f3247b0fe45604460d6eba8209b0c6701c00508ecf050e950de4a3d53125bb8fa2b370fcd336c660e76a02cf31086398255cd8e24730de211b161b7039'
            '540b400c0b912138f43fc9bf2a7db9cf2d1b3100ccbcd6bb1efb00332abaf97ec3b91fa924d8ed21f511fe547a6f994dc301a5ed535a962230cb73d1ed2ee764')

build() {
  make -C "quake2-${pkgver}" WITH_RPATH=no WITH_SYSTEMWIDE=yes
}

package() {
  cd "quake2-${pkgver}"

  # client + server binaries, renderer libraries
  install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" release/{quake2,q2ded,*.so}

  # symlinks to make the commands available
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/quake2" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/lib/${pkgname}/q2ded" "${pkgdir}/usr/bin/yamagi-q2ded"

  # game library
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/baseq2" 'release/baseq2/game.so'

  # shared game directory
  install -d "${pkgdir}/usr/share/games/quake2"
  echo "You can put Quake 2 game files here." > "${pkgdir}/usr/share/games/quake2/README"

  # doc
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'stuff/yq2.cfg' doc/*.md

  # desktop entry
  install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"
  install -Dm644 'stuff/icon/Quake2.png' "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # licenses
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
