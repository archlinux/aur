# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.31.0
pkgrel=2
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
sha512sums=('450a07133c32a86ece652aec68583421006d6571a5e24cf4963bc7bd746f6ccafc4590ea52d0868ffa0e82367d916d4bb050c57e66ea32bc7458ec87f6ce8e48'
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
  install -Dm444 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

