# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.26.0
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
sha512sums=('f57c9aa5d40446b6ca750c49b1868bbc1581cf9fe38f012625a2c0fa2097536e5f9354b8b0dd106344143c726adba3c4736c2def412b2b67f53c65ae72e1e94f'
	    '85d6c8c8247a27d7a7b98d55820563cba436cbc7390e09f39e3cfe0cab618b16fb102016adecedb31af0ae709a7f14edee5e5fd27843956df0a6602fe22cea17'
	    '8aa25bd12675cd376cd667a9c07397f62244d6f4bb6316979d7d91146f4556b4d840ccc366d9ccc6ff8ec149b8a9c0bd66c2b9d73fb97b5d84d47283d8293c36'
	    'aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957')

prepare() {
  chmod u+x ${srcdir}/${_srcimage}
  ${srcdir}/${_srcimage} --appimage-extract
}

package() {
  find ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
  find ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +
  install -d ${pkgdir}/opt/${pkgname}
  cp -r ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname}
  rm -r ${pkgdir}/opt/${pkgname}/usr/

  find ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

  install -Dm644 ${srcdir}/criptext.desktop ${pkgdir}/usr/share/applications/criptext.desktop

  install -Dm755 ${srcdir}/criptext ${pkgdir}/usr/bin/criptext
  install -Dm444 ${srcdir}/LICENSE ${pkgdir}/usr/share/LICENSES/${pkgname}/LICENSE
}

