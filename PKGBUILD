# Maintainer: Keshav Bhatt <keshavnrj@gmail.com>

pkgname=colorsmith
pkgver=1.1.0
pkgrel=1
pkgdesc="ColorSmith - Modern Color Picker for Linux and Windows Desktop"
arch=('x86_64')
url="https://ktechpit.com/USS/public/product.php?slug=colorsmith"
license=('GPL-3.0+')
options=('!strip' '!debug')
depends=(
  'qt6-base'
)
makedepends=(
  'squashfs-tools'
  'curl'
  'jq'
)

DLAGENTS+=("snap::${BASH_SOURCE[0]%/*}/snap-dlagent.sh %u %o")
source=("${pkgname}-${pkgver}.snap::snap://api.snapcraft.io/v2/snaps/info/colorsmith"
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
  install -Dm755 squashfs-root/usr/bin/colorsmith \
    "${pkgdir}/usr/bin/${pkgname}"

  # Icon
  install -Dm644 \
    squashfs-root/usr/share/icons/hicolor/scalable/apps/com.ktechpit.colorsmith.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.ktechpit.colorsmith.svg"

  # Desktop file — the snap build rewrites Icon= to ${SNAP}/meta/gui/icon.png;
  # restore it to a plain icon name for the system installation.
  install -Dm644 \
    squashfs-root/usr/share/applications/com.ktechpit.colorsmith.desktop \
    "${pkgdir}/usr/share/applications/com.ktechpit.colorsmith.desktop"
  sed -i 's|^Icon=.*|Icon=com.ktechpit.colorsmith|' \
    "${pkgdir}/usr/share/applications/com.ktechpit.colorsmith.desktop"

  # AppStream metainfo
  install -Dm644 \
    squashfs-root/usr/share/metainfo/com.ktechpit.colorsmith.appdata.xml \
    "${pkgdir}/usr/share/metainfo/com.ktechpit.colorsmith.appdata.xml"
}
