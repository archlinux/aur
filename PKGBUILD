# Maintainer: Pawel Mosakowski <pawel at mosakowski dot net>
pkgname=appgate-sdp-headless
conflicts=('appgate-sdp')
pkgver=4.2.1
_download_pkgver=4.2
pkgrel=1
pkgdesc="Software Defined Perimeter - headless client. Does not support 2FA."
arch=('x86_64')
url="https://www.cyxtera.com/essential-defense/appgate-sdp/support"
license=('custom')

# dependencies calculated by debtap
depends=('glib2>=2.31.8' 'iptables' 'libsecret>=0.18' 'python-dbus' 'zlib>=1.1.4' 'dnsmasq')
optdepends=('bash-completion>=1.18')
provides=('appgate-sdp')

backup=('etc/appgate.conf' 'etc/dbus-1/system.d/appgate.conf')
options=('!strip' '!emptydirs')

# install=${pkgname}.install

source=("https://sdpdownloads.cyxtera.com/AppGate-SDP-${_download_pkgver}/clients/${pkgname}_${pkgver}_amd64.deb"
	"appgatedriver.service")

prepare() {
	# Extract package data
	tar -xf data.tar.xz -C "${srcdir}"
}

package(){

	# Fix directories structure differencies
    	cp -dpr "${srcdir}"/{etc,lib,opt,usr} "${pkgdir}"
    	mv -v "$pkgdir/lib/systemd/system" "$pkgdir/usr/lib/systemd/"
    	mv -v "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
    	rm -vrf "$pkgdir/lib"

	mv -v "${pkgdir}/usr/share/doc/appgate-headless" "${pkgdir}/usr/share/doc/appgate-sdp-headless"
    	# copy the service file
	cp -v "${srcdir}/appgatedriver.service" "${pkgdir}/usr/lib/systemd/system/appgatedriver.service"

	# install licenses
	LICENSE_DIR="${pkgdir}/usr/share/licenses/${pkgname}"
    	mkdir -vp "$LICENSE_DIR"
    	cp -v "${pkgdir}/usr/share/doc/appgate-sdp-headless/copyright" "$LICENSE_DIR"
}

md5sums=('dae5932ecc0e8f80efdaf7bae9ea2f70'
         'b5946b4a978c39467714f58e04726491')
