# Maintainer: Carlos Bellino <carlosbellino (at) gmail (dot) com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: metzen <metzen@gmail.com>

pkgname=logmein-hamachi-beta
_pkgname=logmein-hamachi
pkgver=2.1.0.189
pkgrel=1
pkgdesc="A zero-configuration VPN service"
url="https://www.vpn.net/linux"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h")
license=("custom")
conflicts=("hamachi")
replaces=("hamachi")
options=("!strip")
depends=('glibc>=2.26')

sha1sums=('2b8052f91bb47beac1fdab0c0c455a36f8876671')
[ "${CARCH}" == "i686" ] && _filearch_=x86 && sha1sums+=('d0547257141f5c9446df1abc1820e45584781d32')
[ "${CARCH}" == "x86_64" ] && _filearch_=x64 && sha1sums+=('edb49508470252b6d95ce3eabeb7c9c86ad3fbfa')
[ "${CARCH}" == "arm" ] && _filearch_=armel && sha1sums+=('e980a86f5d658d51622533560305057116a06df6')
[ "${CARCH}" == "armv6h" ] && _filearch_=armel && sha1sums+=('e980a86f5d658d51622533560305057116a06df6')
[ "${CARCH}" == "armv7h" ] && _filearch_=armhf && sha1sums+=('2b64ae08808c90877a302e5090a2cdd3cf7e5f13')

source=("systemd")
if [ "${CARCH}" == "i686" ] || [ "${CARCH}" == "x86_64" ]; then
	source+=("https://www.vpn.net/installers/${_pkgname}-${pkgver}-${_filearch_}_beta.tgz")
elif [ "${CARCH}" == "arm" ] || [ "${CARCH}" == "armv6h" ] || [ "${CARCH}" == "armv7h" ]; then
	source+=("https://www.vpn.net/installers/${_pkgname}-${pkgver}-${_filearch_}.tgz")
fi

package() {
	cd "${srcdir}"/${_pkgname}-${pkgver}-${_filearch_}

	# Directories
	install -d "${pkgdir}"/opt/${_pkgname}/bin
	install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/systemd/system
	install -d "${pkgdir}"/usr/share/licenses/${_pkgname}

	# Files
	install -m 755 hamachid "${pkgdir}"/opt/${_pkgname}/bin
	install -m 755 dnsup "${pkgdir}"/opt/${_pkgname}/bin
	install -m 755 dnsdown "${pkgdir}"/opt/${_pkgname}/bin
	install -m 755 uninstall.sh "${pkgdir}"/opt/${_pkgname}
	install -m 444 README "${pkgdir}"/opt/${_pkgname}
	install -m 444 LICENSE "${pkgdir}"/opt/${_pkgname}
	install -m 444 CHANGES "${pkgdir}"/opt/${_pkgname}
	ln -sf "/opt/${_pkgname}/bin/hamachid" "${pkgdir}"/usr/bin/hamachi
	install -m 644 "${srcdir}"/systemd "${pkgdir}"/usr/lib/systemd/system/${_pkgname}.service

	# License
	ln -sf "/opt/${_pkgname}/LICENSE" "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
