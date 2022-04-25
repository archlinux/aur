# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=private-internet-access-vpn
pkgver=3.4
pkgrel=2
pkgdesc="Installs VPN profiles for Private Internet Access Service"
arch=("any")
url="https://www.privateinternetaccess.com/"
license=('GPL')
depends=('python' 'python-setuptools' 'python-docopt' 'openvpn')
makedepends=('git')
optdepends=('networkmanager: Enables PIA for Network Manager (needs a openvpn plugin)'
            'connman: Enables PIA for Connman')
conflicts=('xawtv') # Both packages install a `pia` executable

sha256sums=('bc38427782aedc90cb65b322cd6f9d74af4e988cc5b3c884e43236ed7a5e4491'
            '38758f393590c51ec1566aba19beaed7c4fa8bd6f7c323f44ab00b9eb9fd7577'
            '4322a2a4bc3e206c6ab7e1df87a8805032b76c177c1ed9dd3501260ed32ccb30'
            '797dbdb6e3aadc86f97262e26d61cf4847caf85dda4b7a97cac59088cb912b27'
            '246fc4dc3218f56b4c70014df6801b10fc2a573d6545962b7fce05f16908c54e'
            '7f4a5ee1fb8ea4d0e69ed2a8217c575cf335f21e90082f6e423c769eca4a7a46'
            'dd15ff9d020d6779c51bff560c8571b462cc7ca3f4d2a92b8103056be4b2e0fd'
            'SKIP'
            'SKIP')

source=("default-$pkgver-$pkgrel.zip::https://www.privateinternetaccess.com/openvpn/openvpn.zip"
	      "strong-$pkgver-$pkgrel.zip::https://www.privateinternetaccess.com/openvpn/openvpn-strong.zip"
        "login-example.conf"
	      "pia-example.conf"
	      "restart.conf"
	      "vpn.sh"
	      "pia.8.gz"
	      "git+https://github.com/flamusdiu/python-pia.git#tag=v${pkgver}"
	      "git+https://github.com/masterkorp/openvpn-update-resolv-conf.git")

noextract=("default-$pkgver-$pkgrel.zip"
           "strong-$pkgver-$pkgrel.zip"
           "pia.8.gz")

prepare() {
  cd "${srcdir}"

  echo >&2 "Extracting Certifications..."
  bsdtar -xf default-$pkgver-$pkgrel.zip "*.pem" "*.crt"
  bsdtar -xf strong-$pkgver-$pkgrel.zip "*.pem" "*.crt"

  echo >&2 "Extracting OpenVPN Configurations..."
  if [ -d "vpn-configs" ]; then
      rm -rf vpn-configs
  fi
  mkdir "vpn-configs"
  bsdtar -xf default-$pkgver-$pkgrel.zip -C vpn-configs *.ovpn

  cd "vpn-configs"
  echo >&2 "Creating Remote Host List..."
  touch ../vpn-hosts.txt

  grep -Eo "\s(.*\.privacy\.network)\s" *.ovpn | \
    sed 's/_/ /g;s/.ovpn//;s/: /,/;s/[^ ]\+/\L\u&/g;s/\b\([a-z]\{2\}\)\s/\U&/gi' \
    >> ../vpn-hosts.txt

  echo >&2 "Done."
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
