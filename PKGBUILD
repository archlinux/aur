# Maintainer: Alexander Björk <bjorkalx@protonmail.com>

pkgname="espi-appimage"
pkgdesc="Software recreation of the SP-1200 drum machine"
pkgver="1.0.2"
pkgrel=2
arch=('x86_64')
url="https://low-hiss.com/"
license=('custom')
depends=('fuse2' 'squashfuse')
provides=('espi')
conflicts=('espi')
source=("https://low-hiss.com/eSPi-${pkgver//_/-}.AppImage"
	"espi.sh"
	"eSPi.desktop.patch")
sha256sums=('7eb63b926c70db7e7d5094950c97e3ba8e49a67c177f91d33d586e8a065ac0d4'
	    'edb66d88966e208937628e97da9b6c3a80441b29c1075f5c32c7d6bd0d6cc8cb'
	    '26df8d45e662bde820c114a6e50c5ead169f65a6868ece246c13d36da519673d')
options=(!strip)

prepare() {
  cd "${srcdir}"
  chmod +x eSPi-${pkgver//_/-}.AppImage
  ./eSPi-${pkgver//_/-}.AppImage --appimage-extract
  cd "${srcdir}/squashfs-root/"
  patch --strip=1 < ../eSPi.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/eSPi-${pkgver//_/-}.AppImage" "${pkgdir}/opt/appimages/eSPi-${pkgver//_/-}.AppImage"
  install -Dm755 "${srcdir}/espi.sh" "${pkgdir}/usr/bin/espi"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/squashfs-root/eSPi.desktop" "${pkgdir}/usr/share/applications/eSPi.desktop"
}
