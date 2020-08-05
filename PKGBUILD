# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.30.1
pkgrel=1
pkgdesc='Official Criptext encrypted email client'
arch=('x86_64')
url='https://criptext.com/'
license=('GPL2')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('electron' 'libsecret')
optdepends=('org.freedesktop.secrets: for storing passwords'
            'gnome-keyring: for storing passwords in GNOME Keyring')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}-${pkgrel}.AppImage::https://cdn.criptext.com/Criptext-Email-Desktop/linux/Criptext-${pkgver}.AppImage"
	"criptext"
	"LICENSE")
sha512sums=('37f36650e310e20fca453b47f80dfc2f901c11b4f11097b8a05dd9e6cd90c834d4d4bed0ba02be447d5dafa0af65b6b44a41cf8d2f52da7ca0c49e8e2007106c'
	    '1665c4e992f91c00aab96a39b62c736731727a371c146923cf575d64a7e723f082170f115dc2fe87c6b5510a2f2e0fb12f111e947f6d2da994472d48887a2f5b'
	    'aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957')

prepare() {
  chmod +x ${srcdir}/${pkgname%-bin}-${pkgver}-${pkgrel}.AppImage
  ${srcdir}/${pkgname%-bin}-${pkgver}-${pkgrel}.AppImage --appimage-extract

  # Update .desktop file
  sed -i 's|Exec=AppRun|Exec=/usr/bin/criptext|g' \
	"${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}

package() {
  find ${srcdir}/squashfs-root/{locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +
  install -d ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname}
  rm -r ${pkgdir}/opt/${pkgname}/usr/

  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"

  install -Dm755 ${srcdir}/criptext ${pkgdir}/usr/bin/criptext
  install -Dm444 ${srcdir}/LICENSE ${pkgdir}/usr/share/LICENSES/${pkgname}/LICENSE
}

