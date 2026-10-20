# Maintainer: Bart Libert <aur@bart.libert.email>
pkgname=barracudavpn-bin
pkgver=5.3.10
_fullgpgver=${pkgver}-1196.20260929
pkgrel=1
pkgdesc="Barracuda VPN Client for Linux - needs original download from Barracuda"
arch=("i386" "x86_64")
conflicts=('barracudavpn')
provides=('barracudavpn')
install=${pkgname}.install

url="https://campus.barracuda.com/product/networkaccessclient"
_download_url="http://dlportal.barracudanetworks.com/"
license=("LicenseRef-FortiClientSSLVPN")

_pkg_file_name="VPNClient_${pkgver}_Linux.tar.gz"

_DOWNLOADS_DIR=$(command -v xdg-user-dir 2>&1 > /dev/null && xdg-user-dir DOWNLOAD || echo "$HOME/Downloads")

if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "Package not found!"
		msg2 "The package can be downloaded here: ${_download_url} (needs account)"
		msg2 "Choose NAC / VPN Client -> Barracuda VPN Client ${pkgver} for Linux"
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://${_pkg_file_name}"
		"barracudavpn.conf")
sha256sums=('db493451d64dbade574040a26b4c7a826526aa6fdfa9f6b2e6f7d58f6697cd4c'
            'eb7193369cb43a88e4ce66823195e2dadd4285a48641b2150e0dba148785a717')

options=(debug !strip)

prepare() {
    cd "${srcdir}"
    ar x barracudavpn_${_fullgpgver}_amd64.deb data.tar.xz
    tar -xf data.tar.xz
	sed -i 's@/usr/local/bin/barracudavpn-daemon@/usr/bin/barracudavpn-daemon@g' usr/lib/systemd/system/barracudavpn.service
	cat usr/lib/systemd/system/barracudavpn.service
}

package() {
    echo "${pkgdir}"
    install -Dm 4755 ${srcdir}/usr/local/bin/barracudavpn ${pkgdir}/usr/bin/barracudavpn
    install -Dm 4755 ${srcdir}/usr/local/bin/barracudavpn-daemon ${pkgdir}/usr/bin/barracudavpn-daemon
    install -Dm 4644 ${srcdir}/usr/lib/systemd/system/barracudavpn.service ${pkgdir}/usr/lib/systemd/system/barracudavpn.service
    install -Dm 4755 ${srcdir}/usr/local/lib/barracudavpn/setup-groups ${pkgdir}/usr/lib/barracudavpn/setup-groups
    install -Dm 4644 ${srcdir}/barracudavpn.conf ${pkgdir}/usr/lib/sysusers.d/barracudavpn.conf
}
