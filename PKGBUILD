# Maintainer: Keshav Bhatt <keshavnrj@gmail.com>

pkgname=glate
pkgver=4.1.0
pkgrel=1
pkgdesc="Glate - Translate text and generate speech audio on Linux desktop"
arch=('x86_64')
url="https://ktechpit.com/USS/public/product.php?slug=glate"
license=('LicenseRef-proprietary')
options=('!strip' '!debug')
depends=(
  'qt6-base'
  'ffmpeg'
)
makedepends=(
  'squashfs-tools'
  'curl'
  'jq'
)

DLAGENTS+=("snap::${BASH_SOURCE[0]%/*}/snap-dlagent.sh %u %o")
source=("${pkgname}-${pkgver}.snap::snap://api.snapcraft.io/v2/snaps/info/glate"
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
  install -Dm755 squashfs-root/usr/bin/glate \
    "${pkgdir}/usr/bin/${pkgname}"

  # Icon (hicolor 512x512)
  install -Dm644 \
    squashfs-root/usr/share/icons/hicolor/512x512/apps/com.ktechpit.glate.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.ktechpit.glate.png"

  # Desktop file — the snap build rewrites Icon= to ${SNAP}/meta/gui/icon.png;
  # restore it to a plain icon name for the system installation.
  install -Dm644 \
    squashfs-root/usr/share/applications/com.ktechpit.glate.desktop \
    "${pkgdir}/usr/share/applications/com.ktechpit.glate.desktop"
  sed -i 's|^Icon=.*|Icon=com.ktechpit.glate|' \
    "${pkgdir}/usr/share/applications/com.ktechpit.glate.desktop"

  # AppStream metainfo
  install -Dm644 \
    squashfs-root/usr/share/metainfo/com.ktechpit.glate.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/com.ktechpit.glate.metainfo.xml"
}
