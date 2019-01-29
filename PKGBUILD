# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=purevpn-networkmanager
pkgver=2019.01.28
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
source=("linux-files.zip::https://s3-us-west-1.amazonaws.com/heartbleed/linux/linux-files.zip"
        "template-ovpn"
        "template-pptp"
        "purevpn")
sha256sums=('0c2fecda247c34003468d35b74438443b47fef0e4debdfa7cb1a6a88d2e93bb9'
            '336a901c88e406c05f1ec6d192bf7461145299b3c631eb203cebdc94b63c26d6'
            'eb63f1730a807726e906d6c2e2362ee402f39d3b554bea225d0303a33b19ea58'
            'e647fee6c5600f05d5f90329f63dbd788df0771c3d92973bd10e87d872c62730')
noextract=("linux-files.zip")
install="${pkgname}".install

prepare() {
  cd "${srcdir}"

  msg2 "Extracting Certifications..."
  bsdtar -xf linux-files.zip -s'|[^/]*/||' "*.key" "*.crt"

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
  install -Dm600 {OpenVPN_Config_Files/TCP/ca.crt,OpenVPN_Config_Files/TCP/Wdc.key,vpn-list.tsv} "${pkgdir}"/usr/lib/purevpn
}

