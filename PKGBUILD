# Author and maintainer: jbarnett (aur AT wbarnett DOT us)
pkgname=openvpn-pia
pkgver=2018.01.25
pkgrel=2
pkgdesc="OpenVPN configuration files for Private Internet Access VPN"
url="https://www.privateinternetaccess.com"
arch=('x86_64')
license=('none')
depends=('openvpn')
install='openvpn-pia.install'
source=(${url}/openvpn/openvpn-strong.zip
        README)
sha512sums=('9f2661e742d3a66ce679255d5a722abc320f0250586f844ba00955a903079d8fb4b14579114fb181f9ed58fafe6076fc1f839e725d2169808003ccb6ccbbff96'
            '45cf92acfcc3b6167f3a41536cd1c7bba0c65445a4ce7d9257519d2a8747cf3c0e1159531389ac2ab719e7969c6e8bf6c7a1b232025d14057e82c0bc2b4f3265')

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
