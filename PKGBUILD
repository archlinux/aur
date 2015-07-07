# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
pkgname=private-internet-access-vpn
pkgver=2.2
pkgrel=2
pkgdesc="Installs VPN profiles for Private Internet Access Service"
arch=('any')
url="https://www.privateinternetaccess.com/"
license=('GPL')
depends=('python')
optdepends=('networkmanager: Enables PIA for Network Manager'
            'connman: Enables PIA for Connman'
            'openvpn: Allows running configurations from command-line')
sha256sums=('c2f9af251ae63395896366e0be03ff4eea7748dcc6333fbe777a8f09317bba92'
            '6d3bdc9531f16cc1ad199913a71554a0b50aea87e140b28d079c4ab4c0b8c51b'
            '4322a2a4bc3e206c6ab7e1df87a8805032b76c177c1ed9dd3501260ed32ccb30'
            '52f69f37c525bde28cfee8b5b8905c75ee60b6ba35c16541da9ac6300b378553'
            '246fc4dc3218f56b4c70014df6801b10fc2a573d6545962b7fce05f16908c54e'
            '7f4a5ee1fb8ea4d0e69ed2a8217c575cf335f21e90082f6e423c769eca4a7a46'
            'f74e0a601d74409c39d36f4d5c6a2f11c9832d05782f804243b3f6ae7e695aab'
            'SKIP')

source=("https://www.privateinternetaccess.com/openvpn/openvpn.zip"
        "https://raw.githubusercontent.com/masterkorp/openvpn-update-resolv-conf/master/update-resolv-conf.sh"
	"login-example.conf"
	"pia-example.conf"
	"restart.conf"
	"vpn.sh"
	"pia.8.gz"
	"git+https://github.com/flamusdiu/python-pia.git#tag=v${pkgver}")
		
noextract=("openvpn.zip"
           "pia.8.gz")


prepare() {
  cd "${srcdir}"
  mkdir "vpn-configs"
  bsdtar -xf openvpn.zip -C "vpn-configs"

  cd "vpn-configs"

  msg2 "Fixing Openvpn Files..."
  for file in *.ovpn
  do
	msg2 "  ${file/%.ovpn/ }..."
    # Switch .ovpn file extensions to .conf.  This is what the openvpn systemd
    # service expects
    new_file_name="${file/%.ovpn/.conf}"
	
    # Swap spaces in filenames for underscores to be more command-line friendly
    new_file_name="${new_file_name/ /_}"
    mv "$file" "$new_file_name"

    # Prevent caching of password in memory 
    echo "auth-nocache" >> "$new_file_name"
	
    # Attempt to ensure that we use PIA DNS servers
    echo "script-security 2" >> "$new_file_name"
    echo "up /etc/openvpn/update-resolv-conf.sh" >> "$new_file_name"
    echo "down /etc/openvpn/update-resolv-conf.sh" >> "$new_file_name"
	
    # Fix certs in configs to use full path so when run from openvpn it works
    # i.e. sudo openvpn --config /etc/openvpn/US_East.conf
    sed -i -e 's:\(^ca.\):\1/etc/openvpn/:;s:\(^crl-verify.\):\1/etc/openvpn/:' "$new_file_name"

  done
  msg2 "Done."

}

package() {
  cd "${srcdir}"
  
  install -dm 755 "${pkgdir}/usr/lib/system/systemd/system-sleep"
  install -dm 755 "${pkgdir}/usr/lib/system/openvpn@.service.d"
  install -dm 600 "${pkgdir}/etc/openvpn"
  install -dm 755 "${pkgdir}/etc/private-internet-access"
  install -dm 755 "${pkgdir}/usr/bin"
  install -dm 755 "${pkgdir}/usr/share/man/man8"

  install -Dm 644 vpn-configs/*.* "${pkgdir}/etc/openvpn/"
  install -m 755 update-resolv-conf.sh "${pkgdir}/etc/openvpn"
  install -m 644 restart.conf "${pkgdir}/usr/lib/system/openvpn@.service.d"
  install -m 755 vpn.sh "${pkgdir}/usr/lib/system/systemd/system-sleep"
  install -m 644 pia.8.gz "${pkgdir}/usr/share/man/man8"

  cd "python-pia"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
