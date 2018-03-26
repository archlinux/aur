# Maintainer: Eduard Wirch <wirch.eduard@gmail.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>

pkgname=xeroxprtdrv
pkgver=5.20.620.4112
pkgrel=1
pkgdesc="Xerox Unix Print Drivers"
arch=('i686' 'x86_64')
url="http://www.xerox.com"
install=${pkgname}.install
license=('custom')
options=('emptydirs')
depends=('gcc-libs' 'libxinerama' 'libxcursor' 'libxdamage' 'libx11'
         'libxau' 'libxdmcp' 'xorg-xhost' 'sed' 'awk')
optdepends=('cups>=1.7')

source=('xeroxprtdrv.license'
        'xerox-prtdrv-xhost-permissions.desktop'
        'service'
        'xeroxprtmgr'
        'XeroxQScript.patch'
)
source_i686=("http://download.support.xerox.com/pub/drivers/CQ8580/drivers/linux/pt_BR/Xeroxv5Pkg-Linuxi686-${pkgver}.rpm")
source_x86_64=("http://download.support.xerox.com/pub/drivers/CQ8580/drivers/linux/pt_BR/Xeroxv5Pkg-Linuxx86_64-${pkgver}.rpm")
md5sums=('0a8eb0c1480a6ccc1ddab7cbb5e1bde4'
         'aaf22b0b7b9059f6377eba41be08fc34'
         'd380002eef6bbbbeb43cd0691123a7d4'
         '1976d9d3e95065820adbe417ec4e5b2d'
         '117637c64980344ca9bb87e8a8f10938')
md5sums_i686=('ecbba8bad483d83840e286c49bf979d5')
md5sums_x86_64=('98c308785477574a83171604582883e1')

prepare() {
    cd "$srcdir"

    # bug-fixing cups filter
    patch -p1 -i XeroxQScript.patch
}

package() {
  cd "${srcdir}"

  # remove RPM SElinux files, they delete these in RPM post-install
  rm -f "${pkgdir}/opt/Xerox/prtsys/PatchSELinuxPolicy" \
        "${pkgdir}/opt/Xerox/prtsys/SELinuxExceptions*.pp"

  # copy the bits
  cp -dpr opt "${pkgdir}"
  cp -dpr usr "${pkgdir}"

  # systemctl wrapper patch
  cp service "$pkgdir/opt/Xerox/prtsys/"
  mv "$pkgdir/opt/Xerox/prtsys/xeroxprtmgr" "$pkgdir/opt/Xerox/prtsys/xeroxprtmgr.wrapped"
  install -m 755 xeroxprtmgr "$pkgdir/opt/Xerox/prtsys/"

  # Stuff from Xerox's postinstall file
  install -m 775 -g lp -d "$pkgdir/etc/cups/interfaces"
  install -m 775 -g lp -d "$pkgdir/var/spool/lpd"
  # unsing 777 so any user will be able to create a phonebook
  install -m 777 -d "$pkgdir/opt/Xerox/prtsys/db/phonebook/user"

  # commercial license
  install -Dm0644 "../${pkgname}.license" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "$pkgdir/etc/xdg/autostart"
  install xerox-prtdrv-xhost-permissions.desktop "$pkgdir/etc/xdg/autostart"
}

