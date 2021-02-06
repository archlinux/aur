# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=micro-cap
pkgver=12
pkgrel=1
epoch=0
pkgdesc='an integrated schematic editor and mixed analog/digital circuit simulator'
arch=(x86_64)
url='http://www.spectrum-soft.com/index.shtm'
license=('custom')
depends=(
wine
wine-gecko
wine-mono
)

# archived at https://web.archive.org/web/20201107223859/http://www.spectrum-soft.com/download/mc12cd.zip
source=("${pkgname}-${pkgver}.zip::http://www.spectrum-soft.com/download/mc${pkgver}cd.zip" launcher setup.iss.tar LICENSE)
sha256sums=('f4fda36ae96ab618c0487b2ff199b37bb8b12a26ecabc2ef11c6d36a5bac02a7'
            'd4d5d2ce22691a8668ad5071c57f860e686b061142f8c9bd4cefe01df5f3c87f'
            'd51262c700c2e860bbb8d6d9c0cacc424ba4a60edd299ce20b46367cc078fbbf'
            '350a5c1fe63617959e971db8f3f97a694b251fefee296c88fcbd939d3ec90f63')

build(){
  install -m755 -d tmp tmp/env tmp/local
  export WINEPREFIX="${srcdir}/"tmp/env
  export XDG_DATA_HOME="${srcdir}"/tmp/local
  wineboot -u

  cp setup.iss tmp/env/drive_c 
  WINEDEBUG=-all wine "$srcdir"/setup.exe /SMS /s /f1"C:\setup.iss"
}

package() {
  cp launcher micro-cap
  chmod +x micro-cap
  install -m755 -Dt "${pkgdir}"/usr/bin micro-cap

  rm micro-cap
  rm launcher
  rm ${pkgname}-${pkgver}.zip

  install -d -m755 "${pkgdir}"/usr/share/micro-cap/
  cp -a "${srcdir}/"tmp/env "${pkgdir}"/usr/share/micro-cap
  cp -a "${srcdir}/"tmp/local "${pkgdir}"/usr/share/micro-cap

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
