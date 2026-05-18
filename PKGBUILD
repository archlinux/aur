# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=unraid-usb-creator
pkgver=1.1.0
pkgrel=1
pkgdesc="Official Unraid OS USB Flash Creator (Professional Repack)"
arch=('x86_64')
url="https://unraid.net/download"
license=('custom')
depends=('curl' 'gnutls' 'hicolor-icon-theme' 'libarchive' 'libusb' 'polkit' 'qt6-base' 'qt6-declarative' 'xz' 'zstd')
provides=('unraid-usb-creator-bin' 'unraid-usb-creator-git')
conflicts=('unraid-usb-creator-bin' 'unraid-usb-creator-git')
source=("${pkgname}-${pkgver}.appimage::https://github.com/unraid/usb-creator-next/releases/download/v${pkgver}/unraid-usb-creator-${pkgver}.appimage")
sha256sums=('348fd23203aece27ef8e1b4ae0fcbdea56ee23fbaf24ed0d88caf6ccdb4d4949')

prepare() {
  chmod +x "${pkgname}-${pkgver}.appimage"
  ./"${pkgname}-${pkgver}.appimage" --appimage-extract
}

package() {
  # Install the main binary
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/unraid-usb-creator" "${pkgdir}/usr/bin/unraid-usb-creator"

  # Install the desktop file
  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/com.limetech.unraid-usb-creator.desktop" \
    "${pkgdir}/usr/share/applications/unraid-usb-creator.desktop"
  
  # Polish the desktop file
  sed -i 's/^Exec=.*/Exec=unraid-usb-creator/' "${pkgdir}/usr/share/applications/unraid-usb-creator.desktop"
  sed -i 's/^Icon=.*/Icon=unraid-usb-creator/' "${pkgdir}/usr/share/applications/unraid-usb-creator.desktop"
  sed -i 's/^Name=.*/Name=Unraid USB Creator/' "${pkgdir}/usr/share/applications/unraid-usb-creator.desktop"

  # Install the icon
  install -Dm644 "${srcdir}/squashfs-root/unraid.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/unraid-usb-creator.svg"
}
