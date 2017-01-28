# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=openvpn-xor-git
_pkgname=openvpn
pkgver=2.4.0
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network) - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/Tunnelblick/Tunnelblick/tree/master/third_party/sources/openvpn'
depends=('openssl' 'lzo' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa: easy CA and certificate handling')
makedepends=('git' 'systemd')
conflicts=('openvpn' 'openvpn-dev' 'openvpn-git')
provides=('openvpn=2.4.0' 'openvpn-dev')
license=('custom')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
	   "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/02-tunnelblick-openvpn_xorpatch-a.diff"
	   "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/03-tunnelblick-openvpn_xorpatch-b.diff"
	   "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/04-tunnelblick-openvpn_xorpatch-c.diff"
	   "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/05-tunnelblick-openvpn_xorpatch-d.diff"
	   "https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-${pkgver}/patches/06-tunnelblick-openvpn_xorpatch-e.diff")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
	cd "${_pkgname}-${pkgver}"/

	# regenerate configure script
	autoreconf -vi

	# apply Tunnelblick patches to the source
	git apply ../../02-tunnelblick-openvpn_xorpatch-a.diff
	git apply ../../03-tunnelblick-openvpn_xorpatch-b.diff
	git apply ../../04-tunnelblick-openvpn_xorpatch-c.diff
	git apply ../../05-tunnelblick-openvpn_xorpatch-d.diff
	git apply ../../06-tunnelblick-openvpn_xorpatch-e.diff
}

build() {
	cd "${_pkgname}-${pkgver}"/

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--enable-iproute2 \
		--enable-pkcs11 \
		--enable-plugins \
		--enable-systemd \
		--enable-x509-alt-username
	 make
}

check() {
	cd "${_pkgname}-${pkgver}"/

	make check
}

package() {
	cd "${_pkgname}-${pkgver}"/

	# Install openvpn
	make DESTDIR="${pkgdir}" install

	# Create empty configuration directories
	install -d -m0750 -g 90 "${pkgdir}"/etc/openvpn/{client,server}

	# Install examples
	install -d -m0755 "${pkgdir}"/usr/share/openvpn
	cp -r sample/sample-config-files "${pkgdir}"/usr/share/openvpn/examples

	# Install license
	install -d -m0755 "${pkgdir}"/usr/share/licenses/openvpn/
	ln -sf /usr/share/doc/openvpn/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/openvpn/

	# Install contrib
	for FILE in $(find contrib -type f); do
		case "$(file --brief --mime-type "${FILE}")" in
			"text/x-shellscript") install -D -m0755 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
			*) install -D -m0644 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
		esac
	done
}

