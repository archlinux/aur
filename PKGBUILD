# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
pkgname=private-internet-access-vpn
pkgver=1.5
pkgrel=1
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
            '0ee7b31d6a36379adbe402b3db565ce95111443d6d2fd0e6a3ccd4d8a39681c7'
            '9dc895351f55f744329a12a43a300b76dd9cabfa45f9fd0450a4329a09c6930d'
            '55c0935a10a4d036a20fdbe7c690fd1e454802418d4a3d88c4454b99a3260693')

source=("https://www.privateinternetaccess.com/openvpn/openvpn.zip"
        "https://raw.githubusercontent.com/masterkorp/openvpn-update-resolv-conf/master/update-resolv-conf.sh"
		"source.tar.gz"
		"pia"
		"pia.8.gz")
		
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
  install -m 755 pia "${pkgdir}/usr/bin"
  install -m 644 pia.8.gz "${pkgdir}/usr/share/man/man8"
}
