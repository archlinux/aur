# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=purevpn-networkmanager
pkgver=2017.08.26
pkgrel=1
pkgdesc='PureVPN configurations for NetworkManager'
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
sha256sums=('32ee473d414691438618d68740c7060ad1218719e13b41561b18c3d0a659ae01'
            '336a901c88e406c05f1ec6d192bf7461145299b3c631eb203cebdc94b63c26d6'
            'eb63f1730a807726e906d6c2e2362ee402f39d3b554bea225d0303a33b19ea58'
            '8de488f0d3de21711afa19f3a2d61c5405d4c6104363d5c7b6516eb892e66dd8'
            '4bfda53298bd36643d152a2a8ee95bf6d2dde4b5ab5a804d1e758976415349bd')
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
  install -Dm600 {ca.crt,Wdc.key,vpn-list.csv} "${pkgdir}"/usr/lib/purevpn
}

