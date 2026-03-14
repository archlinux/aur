# Maintainer: Keshav Bhatt <keshavnrj@gmail.com>

pkgname=wonderwall
pkgver=8.1.0
pkgrel=1
pkgdesc="WonderWall - Wallpaper browser and downloader for Wallhaven.cc"
arch=('x86_64')
url="https://snapcraft.io/wonderwall"
license=('LicenseRef-proprietary')
options=('!strip' '!debug')
depends=(
  'qt6-base'
  'qt6-webengine'
)
makedepends=(
  'squashfs-tools'
  'curl'
  'jq'
)

DLAGENTS+=("snap::${BASH_SOURCE[0]%/*}/snap-dlagent.sh %u %o")
source=("${pkgname}-${pkgver}.snap::snap://api.snapcraft.io/v2/snaps/info/wonderwall"
  snap-dlagent.sh)
sha256sums=('SKIP'
            'c880bdde94b5d41416f14303e50380442404e21596223516de32c32d3cc96357')

prepare() {
  cd "${srcdir}"
  unsquashfs -no-progress "${pkgname}-${pkgver}.snap"
}

package() {
  cd "${srcdir}"

  # Binary
  install -Dm755 squashfs-root/usr/bin/wonderwall \
    "${pkgdir}/usr/bin/${pkgname}"

  # Icon (hicolor 512x512)
  install -Dm644 \
    squashfs-root/usr/share/icons/hicolor/512x512/apps/com.ktechpit.wonderwall.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.ktechpit.wonderwall.png"

  # Desktop file — the snap build rewrites Icon= to ${SNAP}/meta/gui/icon.png;
  # restore it to a plain icon name for the system installation.
  install -Dm644 \
    squashfs-root/usr/share/applications/com.ktechpit.wonderwall.desktop \
    "${pkgdir}/usr/share/applications/com.ktechpit.wonderwall.desktop"
  sed -i 's|^Icon=.*|Icon=com.ktechpit.wonderwall|' \
    "${pkgdir}/usr/share/applications/com.ktechpit.wonderwall.desktop"

  # AppStream metainfo
  install -Dm644 \
    squashfs-root/usr/share/metainfo/com.ktechpit.wonderwall.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/com.ktechpit.wonderwall.metainfo.xml"
}
