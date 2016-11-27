# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=openvpn-git
pkgver=2.4.beta2.r0.g9bc2be7
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network) - git checkout'
arch=(i686 x86_64)
url='http://openvpn.net/index.php/open-source.html'
depends=('openssl' 'lzo' 'snappy' 'lz4' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa: easy CA and certificate handling')
makedepends=('git' 'systemd')
conflicts=('openvpn' 'openvpn-dev')
provides=('openvpn=2.4.0' 'openvpn-dev')
license=('custom')
# for 2.3.x release branch use: git://git.code.sf.net/p/openvpn/openvpn#branch=release/2.3
source=('git://git.code.sf.net/p/openvpn/openvpn'
        '0001-systemd.patch')
sha256sums=('SKIP'
            '21d09aea89ab3c61239ab4f619ba5885bbd89a45424efb249b108877ed03529e')

pkgver() {
	cd openvpn/

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
	cd openvpn/

	# modifications to upstream systemd units
	patch -Np1 < "${srcdir}"/0001-systemd.patch
}

build() {
	cd openvpn/

	autoreconf -vi
	CFLAGS="${CFLAGS} -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn/plugins\\\"" \
		./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--enable-iproute2 \
		--enable-password-save \
		--enable-pkcs11 \
		--enable-plugins \
		--enable-systemd \
		--enable-x509-alt-username
	 make
}

check() {
	cd openvpn/

	make check
}

package() {
	cd openvpn/

	# Install openvpn
	make DESTDIR="${pkgdir}" install

	# Create empty configuration directory
	install -d -m0750 -g 90 "${pkgdir}"/etc/openvpn/{client,server}

	# Install examples
	install -d -m0755 "${pkgdir}"/usr/share/openvpn
	cp -r sample/sample-config-files "${pkgdir}"/usr/share/openvpn/examples

	# Install license
	install -d -m0755 "${pkgdir}"/usr/share/licenses/openvpn
	ln -sf /usr/share/doc/"${pkgname}"/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/openvpn

	# Install contrib
	install -d -m0755 "${pkgdir}"/usr/share/openvpn/contrib
	cp -r contrib "${pkgdir}"/usr/share/openvpn

	# Install systemd services
	install -d -m0755 "${pkgdir}"/usr/lib/systemd/system/
	install -m0644 distro/systemd/openvpn-{client,server}@.service "${pkgdir}"/usr/lib/systemd/system/
}

