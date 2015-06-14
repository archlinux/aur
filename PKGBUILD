# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
pkgname=private-internet-access-vpn
pkgver=1.3
pkgrel=4
pkgdesc="Installs VPN profiles for Private Internet Access Service"
arch=('any')
url="https://www.privateinternetaccess.com/"
license=('GPL')
depends=('python')
optdepends=('networkmanager: Enables PIA for Network Manager'
            'openvpn: Allows running configurations from command-line')
sha256sums=('88aff6f0fdd2c87523eb1044787287883a0692e94574644260065823ea5a5dfc'
            '6d3bdc9531f16cc1ad199913a71554a0b50aea87e140b28d079c4ab4c0b8c51b'
            'c09bf706dd14b6c89441e204c05656562066029e97a44f9176a9ed29408c40c0'
            'f7062497a64d27aed797c088c7250028d0754963ccd3e8c8c1aff6898092045a'
            '445eaad874754485741fa717842a479c57d9725e81f023f8f6f970349cd2a3b5')

source=("https://www.privateinternetaccess.com/openvpn/openvpn.zip"
        "https://raw.githubusercontent.com/masterkorp/openvpn-update-resolv-conf/master/update-resolv-conf.sh"
		"source.tar.gz"
		"pia-auto-login.py"
		"pia-auto-login.py.8.gz")
		
noextract=("openvpn.zip")

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
  
  cp -R {etc/,usr/} "${pkgdir}"

  install -dm 600 "${pkgdir}/etc/openvpn/"
  install -dm 755 "${pkgdir}/usr/bin/"
  install -dm 755 "${pkgdir}/usr/share/man/man8"

  install -Dm 600 vpn-configs/*.* "${pkgdir}/etc/openvpn/"
  install -m 755 update-resolv-conf.sh "${pkgdir}/etc/openvpn"
  install -m 755 pia-auto-login.py "${pkgdir}/usr/bin"
  install -m 644 pia-auto-login.py.8.gz "${pkgdir}/usr/share/man/man8"
}
