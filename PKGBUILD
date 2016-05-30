# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
pkgname=private-internet-access-vpn
pkgver=2.6.2
pkgrel=1
pkgdesc="Installs VPN profiles for Private Internet Access Service"
arch=('any')
url="https://www.privateinternetaccess.com/"
license=('GPL')
depends=('python' 'python-setuptools' 'python-docopt')
makedepends=('git')
optdepends=('networkmanager: Enables PIA for Network Manager'
            'connman: Enables PIA for Connman'
            'openvpn: Allows running configurations from command-line')
sha256sums=('0ab48c38d1083362d4aaf3d7fb04ce7e1589f5a297675da6effe4f004e2e0b33'
            '4322a2a4bc3e206c6ab7e1df87a8805032b76c177c1ed9dd3501260ed32ccb30'
            '797dbdb6e3aadc86f97262e26d61cf4847caf85dda4b7a97cac59088cb912b27'
            '246fc4dc3218f56b4c70014df6801b10fc2a573d6545962b7fce05f16908c54e'
            '7f4a5ee1fb8ea4d0e69ed2a8217c575cf335f21e90082f6e423c769eca4a7a46'
            'f74e0a601d74409c39d36f4d5c6a2f11c9832d05782f804243b3f6ae7e695aab'
            '7f71b0bf5b2765cfc3c285c60036d4efdca0ba86756b58f228a53ed299600c28'
            'edf29947a752df34eec006adc1cddbf1b73f9757e3752400dffea25d651b80b9'
            'SKIP'
            'SKIP')

source=("https://www.privateinternetaccess.com/openvpn/openvpn.zip"
	"login-example.conf"
	"pia-example.conf"
	"restart.conf"
	"vpn.sh"
	"pia.8.gz"
	"hook.install"
	"hook.remove"
	"git://github.com/flamusdiu/python-pia.git#tag=v${pkgver}"
        "git://github.com/masterkorp/openvpn-update-resolv-conf")
		
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
    new_file_name="${new_file_name// /_}"
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

  install -D -m 644 hook.install "${pkgdir}/usr/share/libalpm/hooks/pia-install.hook"
  install -D -m 644 hook.remove "${pkgdir}/usr/share/libalpm/hooks/pia-remove.hook"
  install -D -m 644 restart.conf "${pkgdir}/usr/lib/system/openvpn@.service.d/restart.conf"
  install -D -m 755 vpn.sh "${pkgdir}/usr/lib/system/systemd/system-sleep/vpn.sh"
  install -D -m 644 pia.8.gz "${pkgdir}/usr/share/man/man8/pia.8.gz"

  
  install -dm755 "${pkgdir}"/etc/{openvpn,private-internet-access}
  install -D -m 600 vpn-configs/*.* "${pkgdir}/etc/openvpn"
  install -D -m 644 {pia-example.conf,login-example.conf} "${pkgdir}/etc/private-internet-access/"

  cd "python-pia"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
