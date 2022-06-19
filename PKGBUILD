# Maintainer: Keshav Bhatt <keshavnrj@gmail.com>

pkgname=wonderwall
pkgver=7.0
pkgrel=4
pkgdesc="WonderWall is a Powerful Desktop Wallpaper manager for Linux and Windows Desktop"
arch=('x86_64')
url="https://snapcraft.io/wonderwall"
license=('PROPRIETARY')
options=('!strip')
depends=(
  'qt5-base'
  'qt5-webkit'
)

makedepends=('squashfs-tools' 'jq')
sha256sums=('SKIP'
            'ca267d51f998533fad921b8f69e81a79f2383862dcb007cac6d3358db00d1a91'
            'fb53d00bf9d57f00c644c81bae0f97fd921a6d387720461cff144918356965ab'
            '073d9958368a1abe4385a8c63ce2f346e823a6772f4c8064b96561a7c1d8e04f')

DLAGENTS+=("snap::${BASH_SOURCE[0]%/*}/snap-dlagent.sh %u %o")
source=("${pkgname}-${pkgver}.squashfs::snap://api.snapcraft.io/v2/snaps/info/wonderwall"
  snap-dlagent.sh
  "${pkgname}.desktop"
  "${pkgname}.sh"
)

prepare() {
  cd "${srcdir}"

  msg2 "Extraction..."
  unsquashfs ${pkgname}-${pkgver}.squashfs
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/opt/"
  cp -r squashfs-root "${pkgdir}/opt/${pkgname}"
  install -Dm755 wonderwall.sh \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 squashfs-root/meta/gui/icon.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  #remove /opt
  rm -rf "${pkgdir}/opt"
}
