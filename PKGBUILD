# Maintainer : Totchi Lagawi <chatnoir420 at gmx dot com>
# Former maintainer: morpheusthewhite <zffromGerace at hotmail dot it>

# Todo if it gets on the AUR : optional support for XOR OpenVPN

pkgname=nordpy
pkgver=1.3.5
pkgrel=2
pkgdesc="An application with gui to connect automatically to the recommended NordVPN server"
arch=('any')
url="https://github.com/morpheusthewhite/NordPy"
license=('GPL3')
groups=()
depends=('python3' 'openvpn' 'tk' 'python-requests' 'wget' 'unzip' 'net-tools' 'iproute2' 'strongswan')
optdepends=('networkmanager-openvpn')
makedepends=('wget')
options=("!strip")
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/morpheusthewhite/NordPy/archive/${pkgver}.tar.gz"
	"https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip"
	"https://downloads.nordvpn.com/certificates/root.der"
	"nordpy.desktop"
)
# TODO: Should I really skip the last two?
sha512sums=(
	'47d67c363b1d927d63e67311469359d011f9e9f4a9156006676997ed31f147dc31da950f911622f86d5fe7b1f2099c0e31e8fd6d2644c1a53ddb184b02bb8086'
	'SKIP'
	'SKIP'
	'610d22b14c4931a7aeae255ea03780ba98991a4f5640ec0cc00ff519225493ddb75d02a2d9d1fd7b5053d31de1f77b71fe858d6d31d5997477799a9253cca8da'
)

prepare() {
	openssl x509 -inform der -in root.der -out root.pem
}

package() {
	install -Dm644 nordpy.desktop $pkgdir/usr/share/applications/nordpy.desktop
	install -Dm644 root.der $pkgdir/usr/share/nordpy/NordVPN.der
	install -Dm644 root.pem $pkgdir/usr/share/nordpy/NordVPN.pem
	install -Dm644 -t $pkgdir/usr/share/nordpy/ovpn_tcp/ ovpn_tcp/*
	install -Dm644 -t $pkgdir/usr/share/nordpy/ovpn_udp/ ovpn_udp/*
	cd $pkgname-$pkgver
	install -Dm755 nordpy.py $pkgdir/usr/share/nordpy/
	install -Dm644 __init__.py $pkgdir/usr/share/nordpy/
	find bin/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/nordpy/{}" \;
	find media/ -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/nordpy/{}" \;
	mkdir -p $pkgdir/usr/bin
	ln -sf $pkgdir/usr/share/nordpy/nordpy.py $pkgdir/usr/bin/nordpy
	chmod 755 $pkgdir/usr/bin/nordpy
}
