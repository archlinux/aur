# Maintainer: Bart Libert <aur@bart.libert.email>
pkgname=barracudavpn-bin
pkgver=5.3.6
pkgrel=1
pkgdesc="Barracuda VPN Client for Linux - needs original download from Barracuda"
arch=("i386" "x86_64")
conflicts=('barracudavpn')
provides=('barracudavpn')

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

source=("local://${_pkg_file_name}")
sha256sums=('bec85b2297ee588bf3c82e8e945245eb9755bcbf49d2af68eb857b2e61875699')

options=(debug !strip)

prepare() {
    cd "${srcdir}"
    ar x barracudavpn_${pkgver}_amd64.deb data.tar.zst
    tar -xf data.tar.zst
}

package() {
    echo "${pkgdir}"
    install -Dm 4755 ${srcdir}/usr/local/bin/barracudavpn ${pkgdir}/usr/bin/barracudavpn
}
