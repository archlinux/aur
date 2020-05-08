# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=purevpn-networkmanager
pkgver=2019.09.11
pkgrel=2
pkgdesc='A script to generate template-based PureVPN configuration files for NetworkManager'
arch=('any')
url='https://www.purevpn.com/'
license=('GPL')
depends=('bash')
optdepends=("networkmanager-openvpn: for the OpenVPN protocol"
            "networkmanager-pptp: for the PPTP protocol")
makedepends=("curl")
replaces=('purevpn-openvpn')
source=("OVPN-files.zip::https://s3.amazonaws.com/dialer_downloads/Openvpn/openvpn-install.zip"
        "template-ovpn"
        "template-pptp"
        "purevpn")
sha256sums=('4d0453644bba15d7d4da40cd94ab3d7e25bb2a9ca226c03ae08f3a3dac2de46d'
            '025a9062b948d05d8648c660674090b79164147ad51ed47a45d10695561e334e'
            'eb63f1730a807726e906d6c2e2362ee402f39d3b554bea225d0303a33b19ea58'
            'b7941e9798e3685b2f396401730747470277c1b77a2d0cfb6048f034e3c00647')
noextract=("OVPN-files.zip")
install="${pkgname}".install

prepare() {
  cd "${srcdir}"

  msg2 "Extracting Certifications..."
  bsdtar -xf OVPN-files.zip -s'|[^/].*/||' "*.key" "*.crt"

  msg2 "Getting latest list of VPN servers..."

  ## Lots of credit to: https://stackoverflow.com/a/10189130/6047155
  curl "https://support.purevpn.com/vpn-servers" 2>/dev/null | \
    grep -i -e '</\?TABLE\|</\?TD\|</\?TR\|</\?TH' | \
    sed 's/^[\ \t]*//g' | tr -d '\n' | \
    sed 's/<\/TR[^>]*>/\n/Ig;s/<\/\?\(TABLE\|TR\)[^>]*>//Ig' | \
    sed 's/^<T[DH][^>]*>\|<\/\?T[DH][^>]*>$//Ig;s/<\/T[DH][^>]*><T[DH][^>]*>/\t/Ig' | \
    sed 's/<[^<>]*>//g;s/\s*\t\s*/\t/g;1d' > vpn-list.tsv
}

package() {
  install -dm755 "${pkgdir}"/usr/bin
  install -dm755 "${pkgdir}"/usr/lib/purevpn
  install -D -m 755 "${startdir}/purevpn" "${pkgdir}"/usr/bin
  install -D -m 644 "${startdir}"/{template-ovpn,template-pptp} "${pkgdir}"/usr/lib/purevpn
  cd "${srcdir}"
  install -Dm644 vpn-list.tsv "${pkgdir}"/usr/lib/purevpn
  install -m600 ca.crt "${pkgdir}"/usr/lib/purevpn/ca.crt
  install -m600 Wdc.key "${pkgdir}"/usr/lib/purevpn/Wdc.key
}

