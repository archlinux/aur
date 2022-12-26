# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=electronwmd-appimage
pkgver=1.3.2
_fullpkgver=0.2.2-$pkgver
pkgrel=1
pkgdesc='Upload music to NetMD MiniDisc devices'
arch=('x86_64')
url='https://web.minidisc.wiki/'
license=('GPL2')
depends=()
provides=('web-minidisc-pro' 'electronwmd')
conflicts=('web-minidisc-pro' 'electronwmd')
options=('!strip')
noextract=("electronwmd-${pkgver}.AppImage")
source=("electronwmd-${pkgver}.AppImage::https://github.com/asivery/ElectronWMD/releases/download/v${_fullpkgver}/electronwmd-${_fullpkgver}-linux_x86_64.AppImage"
        "electronwmd.desktop.patch"
        "electronwmd.sh")
sha256sums=('4b1be7a8dd8b524969228d0092602b7e00994714bc7d40cdddb4a5016a3b27e7'
            '591c38d58d2f1f9a63252ff95917bdfff66f4c9684940f20e958194ee3cac0eb'
            '17538d248d36555d08227cf28c0e3436d92c0ed00f317dd9a1833a3cc847a530')

prepare() {
  cd "${srcdir}"
  chmod +x electronwmd-${pkgver}.AppImage
  ./electronwmd-${pkgver}.AppImage --appimage-extract electronwmd.desktop
  ./electronwmd-${pkgver}.AppImage --appimage-extract usr/share/icons
  patch -Np0 < electronwmd.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/electronwmd-${pkgver}.AppImage" "${pkgdir}/opt/appimages/electronwmd.AppImage"
  install -Dm755 "${srcdir}/electronwmd.sh" "${pkgdir}/usr/bin/electronwmd"

  install -dm755 "${pkgdir}/usr/share"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/electronwmd.desktop" "${pkgdir}/usr/share/applications/electronwmd.desktop"
}
