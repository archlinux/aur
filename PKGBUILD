# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=openvpn-git
pkgver=2.4.beta1.r1.g237fd7f
pkgrel=1
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network) - git checkout"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo' 'snappy' 'lz4' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa: easy CA and certificate handling')
makedepends=('git' 'systemd')
conflicts=('openvpn' 'openvpn-dev')
provides=('openvpn=2.4.0' 'openvpn-dev')
license=('custom')
# for 2.3.x release branch use: git://git.code.sf.net/p/openvpn/openvpn#branch=release/2.3
source=('git://git.code.sf.net/p/openvpn/openvpn')
sha256sums=('SKIP')

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

build() {
	cd openvpn/

	# Build openvpn
	autoreconf -vi
	CFLAGS="${CFLAGS} -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--enable-password-save \
		--mandir=/usr/share/man \
		--enable-iproute2 \
		--enable-systemd \
		--enable-pkcs11 \
		--enable-x509-alt-username
	 make
}

package() {
	cd openvpn/

	# Install openvpn
	make DESTDIR=${pkgdir} install
	install -d -m0755 ${pkgdir}/etc/openvpn

	# Install examples
	install -d -m0755 ${pkgdir}/usr/share/openvpn
	cp -r sample/sample-config-files ${pkgdir}/usr/share/openvpn/examples

	# Install license
	install -d -m0755 ${pkgdir}/usr/share/licenses/openvpn
	ln -sf /usr/share/doc/${pkgname}/{COPYING,COPYRIGHT.GPL} ${pkgdir}/usr/share/licenses/openvpn

	# Install contrib
	install -d -m0755 ${pkgdir}/usr/share/openvpn/contrib
	cp -r contrib ${pkgdir}/usr/share/openvpn

	# Install systemd services
	install -D -m0644 distro/systemd/openvpn-client@.service ${pkgdir}/usr/lib/systemd/system/openvpn-client@.service
	install -D -m0644 distro/systemd/openvpn-server@.service ${pkgdir}/usr/lib/systemd/system/openvpn-server@.service
}

