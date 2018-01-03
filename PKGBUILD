# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=private-internet-access-vpn
pkgver=3.3.3
pkgrel=3
pkgdesc="Installs VPN profiles for Private Internet Access Service"
arch=('any')
url="https://www.privateinternetaccess.com/"
license=('GPL')
depends=('python' 'python-setuptools' 'python-docopt' 'openvpn')
makedepends=('git')
optdepends=('networkmanager: Enables PIA for Network Manager (needs a openvpn plugin)'
            'connman: Enables PIA for Connman')
			
sha256sums=('04d6c427203f17b22a524772ae940be58a9f38a88518a36bc971d3ba6951f50c'
            '827a7a60bb3a9124b8738da706dfefbd28b0cb34632be40a84c52462d760ddf7'
            'ee525ada8913a80c169c3c1f4fccd44fef7c7214f2bd4a6b4b613e8b0b1a2dac'
            '4322a2a4bc3e206c6ab7e1df87a8805032b76c177c1ed9dd3501260ed32ccb30'
            '797dbdb6e3aadc86f97262e26d61cf4847caf85dda4b7a97cac59088cb912b27'
            '246fc4dc3218f56b4c70014df6801b10fc2a573d6545962b7fce05f16908c54e'
            '7f4a5ee1fb8ea4d0e69ed2a8217c575cf335f21e90082f6e423c769eca4a7a46'
            'dd15ff9d020d6779c51bff560c8571b462cc7ca3f4d2a92b8103056be4b2e0fd'
            'SKIP'
            'SKIP')

source=("https://www.privateinternetaccess.com/openvpn/openvpn-ip-lport.zip"
        "https://www.privateinternetaccess.com/openvpn/openvpn.zip"
	"https://www.privateinternetaccess.com/openvpn/openvpn-strong.zip"
        "login-example.conf"
	"pia-example.conf"
	"restart.conf"
	"vpn.sh"
	"pia.8.gz"
	"git+https://github.com/flamusdiu/python-pia.git#tag=v${pkgver}"
	"git+https://github.com/masterkorp/openvpn-update-resolv-conf.git")
		
noextract=("openvpn-ip-lport.zip"
           "openvpn.zip"
           "openvpn-strong.zip"
           "pia.8.gz")

prepare() {
  cd "${srcdir}"
  
  msg2 "Extracting Certifications..."
  bsdtar -xf openvpn-ip-lport.zip "*.pem" "*.crt"
  bsdtar -xf openvpn.zip "*.pem" "*.crt"
  bsdtar -xf openvpn-strong.zip "*.pem" "*.crt"
  
  msg2 "Extracting OpenVPN Configurations..."
  mkdir "vpn-configs"
  bsdtar -xf openvpn.zip -C vpn-configs *.ovpn
  
  cd "vpn-configs"
  msg2 "Creating Remote Host List..."
  touch ../vpn-hosts.txt
  
  find *.ovpn -print0 | while read -d $'\0' file
  do
    host=$(egrep -o "([-A-Za-z]+\.privateinternetaccess\.com)" "$file")
    printf "%s,%s\n"  "${file/%.ovpn/}" ${host} >> ../vpn-hosts.txt
  done
  
  msg2 "Done."
}

package() {
  cd "${srcdir}"

  install -D -m 644 restart.conf "${pkgdir}/usr/lib/systemd/openvpn-client@.service.d/restart.conf"
  install -D -m 755 vpn.sh "${pkgdir}/usr/lib/systemd/system/system-sleep/vpn.sh"
  install -D -m 644 pia.8.gz "${pkgdir}/usr/share/man/man8/pia.8.gz"

  
  install -dm755 "${pkgdir}"/etc/{openvpn,private-internet-access}
  install -g network -dm750 "${pkgdir}"/etc/openvpn/client

  install -D -m 644 vpn-hosts.txt "${pkgdir}/etc/private-internet-access"
  install -D -g network -m 640 *.crt "${pkgdir}/etc/openvpn/client"
  install -D -g network -m 640 *.pem "${pkgdir}/etc/openvpn/client"
  install -D -m 644 {pia-example.conf,login-example.conf} "${pkgdir}/etc/private-internet-access/"

  install -D -m 755 openvpn-update-resolv-conf/update-resolv-conf.sh "${pkgdir}/etc/openvpn/update-resolv-conf.sh"

  cd "python-pia"
  python setup.py install --root="${pkgdir}/" --optimize=1

}
