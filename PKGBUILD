# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: metzen <metzen@gmail.com>

pkgname=logmein-hamachi
pkgver=2.1.0.174
pkgrel=3
pkgdesc="A zero-configuration VPN service"
url="https://www.vpn.net/linux"
arch=("i686" "x86_64" "arm" "armv7h")
license=("custom")
conflicts=("hamachi")
replaces=("hamachi")
options=("!strip")
[ "${CARCH}" == "i686" ] && _filearch_=x86 && sha1sums=('20cc7a0a4c5fb61a5f6769e4d8fff5dab9293e3e' 'c0d5b67ba0a938cef9742568fd09bb2a4b85b513')
[ "${CARCH}" == "x86_64" ] && _filearch_=x64 && sha1sums=('dafb47d24d44dd7bd3a80a81b62a297f497f52a5' 'c0d5b67ba0a938cef9742568fd09bb2a4b85b513')
[ "${CARCH}" == "arm" ] && _filearch_=armel && sha1sums=('328ea87a2f371163a90b9d7518417e5acbcb2da5' 'c0d5b67ba0a938cef9742568fd09bb2a4b85b513')
[ "${CARCH}" == "armv7h" ] && _filearch_=armhf && sha1sums=('dbd32d89063e2ab72b7e51f5706d0d25586d767b' 'c0d5b67ba0a938cef9742568fd09bb2a4b85b513')

source=("https://www.vpn.net/installers/${pkgname}-${pkgver}-${_filearch_}.tgz" "systemd")

source+=("https://archive.archlinux.org/packages/g/glibc/glibc-2.25-7-x86_64.pkg.tar.xz")
sha1sums+=("5d0ac1bf449524db37e94320c0d04d3dbc2d0408")

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}-${_filearch_}

	# Directories
	install -d "${pkgdir}"/opt/${pkgname}/bin
	install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/systemd/system
	install -d "${pkgdir}"/usr/share/licenses/${pkgname}

	# Files
	install -m 755 hamachid "${pkgdir}"/opt/${pkgname}/bin
	install -m 755 dnsup "${pkgdir}"/opt/${pkgname}/bin
	install -m 755 dnsdown "${pkgdir}"/opt/${pkgname}/bin
	install -m 755 uninstall.sh "${pkgdir}"/opt/${pkgname}
	install -m 444 README "${pkgdir}"/opt/${pkgname}
	install -m 444 LICENSE "${pkgdir}"/opt/${pkgname}
	install -m 444 CHANGES "${pkgdir}"/opt/${pkgname}
	ln -sf "/opt/${pkgname}/bin/hamachid" "${pkgdir}"/usr/bin/hamachi
	install -m 644 "${srcdir}"/systemd "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service

	install -d "${pkgdir}"/opt/${pkgname}/glibc225lib
	install -m755 "${srcdir}/usr/lib/ld-2.25.so" "${pkgdir}"/opt/${pkgname}/glibc225lib
	install -m755 "${srcdir}"/usr/lib/*.so.* "${pkgdir}"/opt/${pkgname}/glibc225lib

	# License
	ln -sf "/opt/${pkgname}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
