# Maintainer: Dmitry Razumov <asmeron@ublinux.com>
# Contributor: Eduard Wirch <wirch.eduard@gmail.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>

# Supported products: 
#  ColorQube 8700,ColorQube 8900,ColorQube 9301/9302/9303,Xerox D95/D110/D125 Copier/Printer,WorkCentre 7220/7225,WorkCentre 7830/7835/7845/7855,WorkCentre 5845/5855,
#  WorkCentre 5865/5875/5890,Phaser 3610,WorkCentre 3615,WorkCentre 5945/5955,Xerox D136 Copier/Printer and D136 Printer,Phaser 4622,WorkCentre 3655,
#  WorkCentre 6655,WorkCentre 7970,WorkCentre 4265,ColorQube 8580,ColorQube 8880,Xerox Color C60/C70,Integrated Color Server,WorkCentre 3655i,WorkCentre 5945i/5955i,
#  WorkCentre 6655i,WorkCentre 7830i/7835i/7845i/7855i,WorkCentre 5865i/5875i/5890i,WorkCentre 7220i/7225i,WorkCentre 7970i,VersaLink B7025/B7030/B7035,
#  VersaLink C405 Color Multifunction Printer,VersaLink C400 Color Printer,VersaLink B405 Multifunction Printer,VersaLink B400 Printer,Phaser 6510,WorkCentre 6515,Phaser 3330,
#  WorkCentre 3335/3345,AltaLink B8045 / B8055 / B8065 / B8075 / B8090 Multifunction Printer,AltaLink C8030 / C8035 / C8045 / C8055 / C8070 Color Multifunction Printer,
#  VersaLink B605/B615 Multifunction Printer,VersaLink B600/B610 Printer,VersaLink C500 Printer,VersaLink C600 Printer,VersaLink C505 Multifunction Printer,VersaLink C605,
#  VersaLink C7000 Printer,VersaLink C7020/C7025/C7030 Multifunction Printer,VersaLink C8000 Color Printer,VersaLink C9000 Color Printer,WorkCentre EC7836/EC7856,
#  Xerox B1022/B1025 Multifunction Printer,PrimeLink C9065/C9070 Printer,AltaLink C8130 / C8135 / C8145 / C8155 / C8170 Color Multifunction Printer,
#  AltaLink B8145 / B8155 / B8170 Multifunction Printer,Xerox ED95A/ED125 Copier/Printer,PrimeLink B9100/B9110/B9125/B9136,Xerox Color EC70 Printer,
#  Xerox EC8036 / EC8056 Color Multifunction Printer,Xerox B310 Printer,Xerox C310 Color Printer,Xerox C315 Color Multifunction Printer,Xerox B305 Multifunction Printer,
#  Xerox B315 Multifunction Printer,VersaLink C7120/C7125/C7130 Color Multifunction Printer,VersaLink B7125/B7130/B7135 Multifunction Printer

pkgname=xerox-office-prtdrv
pkgver=5.20.661.4684
pkgrel=1
pkgdesc="Xerox Unix Print Drivers. Supported: ColorQube, WorkCentre, VersaLink, AltaLink, Copier/Printer, Multifunction Printer, Phaser, Integrated Color Server"
arch=('i686' 'x86_64')
url="http://www.xerox.com"
license=('custom:Xerox')
options=('emptydirs')
depends=('gcc-libs' 'libxinerama' 'libxcursor' 'libxdamage' 'libx11'
         'libxau' 'libxdmcp' 'xorg-xhost' 'sed' 'awk' 'lib32-gcc-libs')
optdepends=('cups')
conflicts=('xeroxprtdrv' 'xerox-workcentre-6515')
source=('support.txt'
        'service'
	'xerox-office-prtdrv.license'
        'xerox-office-prtdrv-xhost-permissions.desktop'
        'XeroxOfficeQScript.patch'
	'PatchAppArmorPolicy'
)
install=${pkgname}.install
source_i686=("XeroxOfficev5Pkg-Linuxi686-${pkgver}.rpm::https://download.support.xerox.com/pub/drivers/CQ8580/drivers/linux/pt_BR/XeroxOfficev5Pkg-Linuxi686-${pkgver}.rpm")
source_x86_64=("XeroxOfficev5Pkg-Linuxx86_64-${pkgver}.rpm::https://download.support.xerox.com/pub/drivers/CQ8580/drivers/linux/pt_BR/XeroxOfficev5Pkg-Linuxx86_64-${pkgver}.rpm")
md5sums=('14e2ddf32a41ee7d57927cae62c14884'
         '1bedd6839ef29b0589b9b0822d92a077'
         '0a8eb0c1480a6ccc1ddab7cbb5e1bde4'
         'aaf22b0b7b9059f6377eba41be08fc34'
         '07f4476198347af9898ecacadfbb3596'
         '5b7531cd2da48b8850e4b696f837abbc')
md5sums_i686=('1c52d190633dda7ce1b2ded63a421c0b')
md5sums_x86_64=('86a63066391bb5678433513c5d7dd315')

prepare() {
    # bug-fixing cups filter
    patch -p1 -i "${srcdir}/XeroxOfficeQScript.patch"
}

package() {
    cp -dpr "${srcdir}/opt" "${pkgdir}"
    cp -dpr "${srcdir}/usr" "${pkgdir}"

    # systemctl wrapper patch
    cp service "${pkgdir}/opt/XeroxOffice/prtsys/"

    install -Dm0775 "${srcdir}/PatchAppArmorPolicy" "${pkgdir}/opt/XeroxOffice/prtsys/"
    install -Dm0775 "${srcdir}/xerox-office-prtdrv.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/etc/xdg/autostart"
    install "${srcdir}/xerox-office-prtdrv-xhost-permissions.desktop" "${pkgdir}/etc/xdg/autostart"
}

