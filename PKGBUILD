# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=xeroxprtdrv
pkgver=5.20.558.3113
pkgrel=1
pkgdesc="Xerox Unix Print Drivers"
arch=('i686' 'x86_64')
url="http://www.xerox.com"
install=${pkgname}.install
license=('custom')
options=('emptydirs')
depends=('gcc-libs' 'libxinerama' 'libxcursor' 'libxdamage' 'libx11'
         'libxau' 'libxdmcp' 'xorg-xhost')

if [ "$CARCH" == "i686" ]; then
  source=("http://download.support.xerox.com/pub/drivers/CQ8580/drivers/linux/ar/Xeroxv5Pkg-Linuxi686-${pkgver}.rpm")
  md5sums=('015dd0813b68330de0ed2e14b9063366')
elif [ "$CARCH" == "x86_64" ]; then
  source=("http://download.support.xerox.com/pub/drivers/CQ8580/drivers/linux/ar/Xeroxv5Pkg-Linuxx86_64-${pkgver}.rpm")
  md5sums=('7cced720ba77c2fb745d23fc2836b1d7')
fi
source+=('xeroxprtdrv.license')
md5sums+=('0a8eb0c1480a6ccc1ddab7cbb5e1bde4')

package() {
  # remove RPM SElinux files, they delete these in RPM post-install
  rm -f "${pkgdir}/opt/Xerox/prtsys/PatchSELinuxPolicy" \
        "${pkgdir}/opt/Xerox/prtsys/SELinuxExceptions*.pp"

  # copy the bits
  cp -dpr "${srcdir}/opt" "${pkgdir}"
  cp -dpr "${srcdir}/usr" "${pkgdir}"

  # it's in the RPM post-install 777, not sure what for; skipping chmod 777
  mkdir -p "${pkgdir}/opt/Xerox/prtsys/db/phonebook/user"

  # commercial license
  install -Dm0644 "../${pkgname}.license" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

