# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=electronwmd-appimage
pkgver=1.4.2
_fullpkgver=0.3.1-$pkgver
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
sha256sums=('0ddb673ac71fcaeb34c56bdba2c0279bf78bd2f79845bf23f80376252646946f'
            '67f9612250ea09c0760bf31b83cfb6dd97de21c14aa047ad3092d66b222977fd'
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
