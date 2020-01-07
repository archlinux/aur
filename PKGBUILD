# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.26.5
pkgrel=1
pkgdesc='Official Criptext encrypted email client'
arch=('x86_64')
url='https://criptext.com/'
license=('GPL2')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('electron')
options=(!strip)
_destimage="Criptext-latest.AppImage"
_srcimage="Criptext-${pkgver}.AppImage"
source=("https://cdn.criptext.com/Criptext-Email-Desktop/linux/${_srcimage}"
	"criptext.desktop"
	"criptext"
	"LICENSE")
sha512sums=('18810d86e55682008060b797452730db56aa888d6c2923834df823923f4b1a60c6e4442d1e01be910d842f94afa91b7447be72536a0334238d07b8672b7fc65f'
	    '85d6c8c8247a27d7a7b98d55820563cba436cbc7390e09f39e3cfe0cab618b16fb102016adecedb31af0ae709a7f14edee5e5fd27843956df0a6602fe22cea17'
	    '1665c4e992f91c00aab96a39b62c736731727a371c146923cf575d64a7e723f082170f115dc2fe87c6b5510a2f2e0fb12f111e947f6d2da994472d48887a2f5b'
	    'aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957')

prepare() {
  chmod u+x ${srcdir}/${_srcimage}
  ${srcdir}/${_srcimage} --appimage-extract
}

package() {
  find ${srcdir}/squashfs-root/{locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +
  install -d ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname}
  rm -r ${pkgdir}/opt/${pkgname}/usr/

  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

  install -Dm644 ${srcdir}/criptext.desktop ${pkgdir}/usr/share/applications/criptext.desktop

  install -Dm755 ${srcdir}/criptext ${pkgdir}/usr/bin/criptext
  install -Dm444 ${srcdir}/LICENSE ${pkgdir}/usr/share/LICENSES/${pkgname}/LICENSE
}

