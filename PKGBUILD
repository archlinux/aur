# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=purevpn-networkmanager
pkgver=2019.01.07
pkgrel=1
pkgdesc='A script to generate template-based PureVPN configuration files for NetworkManager'
arch=('any')
url='https://www.purevpn.com/'
license=('GPL')
depends=('bash')
optdepends=("networkmanager-openvpn: for the OpenVPN protocol"
            "networkmanager-pptp: for the PPTP protocol")
replaces=('purevpn-openvpn')
source=("linux-files.zip::https://s3-us-west-1.amazonaws.com/heartbleed/linux/linux-files.zip"
        "template-ovpn"
        "template-pptp"
        "purevpn"
        "vpn-list.csv")
sha256sums=('0c2fecda247c34003468d35b74438443b47fef0e4debdfa7cb1a6a88d2e93bb9'
            '336a901c88e406c05f1ec6d192bf7461145299b3c631eb203cebdc94b63c26d6'
            'eb63f1730a807726e906d6c2e2362ee402f39d3b554bea225d0303a33b19ea58'
            '8de488f0d3de21711afa19f3a2d61c5405d4c6104363d5c7b6516eb892e66dd8'
            '1c8de4640f8f358aaa8df53660516e155f29c1a42fde1f2f7f226b775e77e463')
noextract=("linux-files.zip")
install="${pkgname}".install

prepare() {
  cd "${srcdir}"

  msg2 "Extracting Certifications..."
  bsdtar -xf linux-files.zip -s'|[^/]*/||' "*.key" "*.crt"
}

package() {
  install -dm755 "${pkgdir}"/usr/bin
  install -dm755 "${pkgdir}"/usr/lib/purevpn
  install -D -m 755 "${startdir}/purevpn" "${pkgdir}"/usr/bin
  install -D -m 644 "${startdir}"/{template-ovpn,template-pptp} "${pkgdir}"/usr/lib/purevpn
  cd "${srcdir}"
  install -Dm600 {OpenVPN_Config_Files/TCP/ca.crt,OpenVPN_Config_Files/TCP/Wdc.key,vpn-list.csv} "${pkgdir}"/usr/lib/purevpn
}

