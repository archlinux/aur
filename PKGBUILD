# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=easy-rsa-git
pkgver=3.0.1.r14.g5a429d2
pkgrel=1
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network) - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/OpenVPN/easy-rsa"
depends=('openssl')
makedepends=('git')
conflicts=('easy-rsa' 'openvpn')
provides=('easy-rsa')
license=('custom')
backup=('etc/easy-rsa/openssl-1.0.cnf'
	'etc/easy-rsa/vars')
source=('git://github.com/OpenVPN/easy-rsa.git')
sha256sums=('SKIP')

pkgver() {
	cd easy-rsa/

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
	cd easy-rsa/

	# change path for configuration in /etc
	sed -i "/set_var EASYRSA\t/c \\\tset_var EASYRSA\t\t\"/etc/easy-rsa\"" easyrsa3/easyrsa

	# fix output of help command, we have it in PATH
	sed -i 's|./easyrsa|easyrsa|' easyrsa3/easyrsa
}

package() {
	cd easy-rsa/

	install -D -m0755 easyrsa3/easyrsa "${pkgdir}"/usr/bin/easyrsa

	install -D -m0644 easyrsa3/openssl-1.0.cnf "${pkgdir}"/etc/easy-rsa/openssl-1.0.cnf
	install -D -m0644 easyrsa3/vars.example "${pkgdir}"/etc/easy-rsa/vars
	install -d -m0755 "${pkgdir}"/etc/easy-rsa/x509-types/
	install -m0644 easyrsa3/x509-types/* "${pkgdir}"/etc/easy-rsa/x509-types/

	install -d -m0755  ${pkgdir}/usr/share/doc/easy-rsa/
	install -m0644 doc/* ChangeLog KNOWN_ISSUES ${pkgdir}/usr/share/doc/easy-rsa/

	install -D -m0644 COPYING.md ${pkgdir}/usr/share/licenses/easy-rsa/COPYING.md
}

