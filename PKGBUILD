# Author and maintainer: jbarnett (aur AT wbarnett DOT us)
pkgname=openvpn-pia
pkgver=2018.01.25
pkgrel=4
pkgdesc="OpenVPN configuration files for Private Internet Access VPN"
url="https://www.privateinternetaccess.com"
arch=('x86_64')
license=('none')
depends=('openvpn')
install='openvpn-pia.install'
source=(${url}/openvpn/openvpn-strong.zip
        README)
sha512sums=('9f2661e742d3a66ce679255d5a722abc320f0250586f844ba00955a903079d8fb4b14579114fb181f9ed58fafe6076fc1f839e725d2169808003ccb6ccbbff96'
            '80aeaa4945b1c7df5eec07886dca24a5803f89f1904eb4252097a918e10b910ea655addcb99124ff0b86250a1b98a490c39e195c2cb4e725b5ea00312e594c5a')

prepare() {
    cd $srcdir
    for i in *.ovpn; do mv "$i" "$(echo $i | sed -e 's/ /-/g' -e 's/ovpn/conf/')"; done
    sed -i -e 's$auth-user-pass$auth-user-pass /etc/openvpn-pia.conf$g' \
           -e 's$ca.rsa.4096.crt$/etc/openvpn/client/ca.rsa.4096.crt$g' \
           -e 's$crl.rsa.4096.pem$/etc/openvpn/client/crl.rsa.4096.pem$g' *.conf
}

package() {
    cd $srcdir
    mkdir -p -m750 $pkgdir/etc/openvpn/client
    mkdir -p -m755 $pkgdir/usr/share/doc/openvpn-pia
    install -m644 README -t $pkgdir/usr/share/doc/openvpn-pia/
    install -m644 *{.conf,.pem,.crt} -t $pkgdir/etc/openvpn/client/
}
