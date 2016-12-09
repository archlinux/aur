pkgname=openvpn-mbedtls-git
pkgver=2.4.rc1.r8.gc00919e
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network) - git checkout'
arch=(i686 x86_64)
url='http://openvpn.net/index.php/open-source.html'
depends=('openssl' 'mbedtls'  'lzo' 'iproute2' 'libsystemd')
optdepends=('easy-rsa: easy CA and certificate handling')
makedepends=('git' 'systemd')
conflicts=('openvpn' 'openvpn-dev' 'openvpn-git')
provides=('openvpn=2.4.0' 'openvpn-dev' 'openvpn-git')
license=('custom')
source=('git://github.com/OpenVPN/openvpn.git'
        '0001-plugin.patch')
sha256sums=('SKIP'
            'b8254067b4ef5d157d87267a76938d86f101972303c7ff20131cc9f28659a30c')

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

	# plugin path
	patch -Np1 < "${srcdir}"/0001-plugin.patch
}

build() {
	cd openvpn/

	autoreconf -vi
	CFLAGS="${CFLAGS} -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn/plugins\\\"" \
		./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-crypto-library=mbedtls \
		--enable-iproute2 \
		--enable-plugins \
		--enable-systemd
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

