# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=easy-rsa-git
pkgver=3.0.4.r33.gff07d75
pkgrel=1
pkgdesc='Simple shell based CA utility - git checkout'
arch=('any')
url='https://github.com/OpenVPN/easy-rsa'
depends=('openssl' 'sh')
makedepends=('git')
conflicts=('easy-rsa')
provides=('easy-rsa')
license=('custom')
backup=('etc/easy-rsa/openssl-easyrsa.cnf'
	'etc/easy-rsa/vars')
source=('git://github.com/OpenVPN/easy-rsa.git'
        '0001-fix-paths.patch')
sha256sums=('SKIP'
            'c8287a6c3e79c36dcadbf2bd11b0fe2698f2ec8d6824b0dc22783ade36b8d2f6')

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
	cd easy-rsa/easyrsa3/

	# fix output of help command, we have it in PATH
	sed -i 's|./easyrsa|easyrsa|' easyrsa

	# fix paths
	patch -Np1 < "${srcdir}"/0001-fix-paths.patch
}

package() {
	cd easy-rsa/

	install -D -m0755 easyrsa3/easyrsa "${pkgdir}"/usr/bin/easyrsa

	install -D -m0644 easyrsa3/openssl-easyrsa.cnf "${pkgdir}"/etc/easy-rsa/openssl-easyrsa.cnf
	install -D -m0644 easyrsa3/vars.example "${pkgdir}"/etc/easy-rsa/vars
	install -d -m0755 "${pkgdir}"/etc/easy-rsa/x509-types/
	install -m0644 easyrsa3/x509-types/* "${pkgdir}"/etc/easy-rsa/x509-types/

	install -d -m0755  ${pkgdir}/usr/share/doc/easy-rsa/
	install -m0644 doc/* ChangeLog ${pkgdir}/usr/share/doc/easy-rsa/

	install -D -m0644 COPYING.md ${pkgdir}/usr/share/licenses/easy-rsa/COPYING
}

