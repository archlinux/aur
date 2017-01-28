# Maintainer: Pete Alexandrou <pete@ozmartians.com>

pkgname=openvpn-xor-git
_pkgname=openvpn
pkgver=2.4.rc2.r26.g4590c383
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network) - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/Tunnelblick/Tunnelblick/tree/master/third_party/sources/openvpn'
depends=('openssl' 'lzo' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa: easy CA and certificate handling')
makedepends=('git' 'systemd')
conflicts=('openvpn' 'openvpn-dev')
provides=('openvpn=2.4.0' 'openvpn-dev')
license=('custom')
# for 2.4.x release branch append: #branch=release/2.4
# source=('git://github.com/OpenVPN/openvpn.git')

source=('https://github.com/openvpn/openvpn/archive/v2.4.0.tar.gz'
	   'https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.0/patches/02-tunnelblick-openvpn_xorpatch-a.diff'
	   'https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.0/patches/03-tunnelblick-openvpn_xorpatch-b.diff'
	   'https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.0/patches/04-tunnelblick-openvpn_xorpatch-c.diff'
	   'https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.0/patches/05-tunnelblick-openvpn_xorpatch-d.diff'
	   'https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.4.0/patches/06-tunnelblick-openvpn_xorpatch-e.diff')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd openvpn-2.4.0/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

prepare() {
	cd openvpn-2.4.0/

	# regenerate configure script
	autoreconf -vi

	# apply Tunnelblick patches to the source
	git apply ../../02-tunnelblick-openvpn_xorpatch-a.diff
	git apply ../../03-tunnelblick-openvpn_xorpatch-b.diff
	git apply ../../04-tunnelblick-openvpn_xorpatch-c.diff
	git apply ../../05-tunnelblick-openvpn_xorpatch-d.diff
	git apply ../../06-tunnelblick-openvpn_xorpatch-e.diff

	# apply watermark patch
	git apply ../../xor_watermark.patch
}

build() {
	cd openvpn-2.4.0/

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
	cd openvpn-2.4.0/

	make check
}

package() {
	cd openvpn-2.4.0/

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

