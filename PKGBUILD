# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Thomas Bächler <thomas@archlinux.org> ([core] package)

pkgname=openvpn-git
pkgver=2.3.beta1.r324.g4ad2b65
pkgrel=1
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network) - git checkout"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo' 'snappy' 'lz4' 'iproute2')
optdepends=('easy-rsa: for easy key management')
conflicts=('openvpn' 'openvpn-dev')
provides=('openvpn=2.3.0' 'openvpn-dev')
license=('custom')
# for 2.3.x release branch use: git://git.code.sf.net/p/openvpn/openvpn#branch=release/2.3
source=('git://git.code.sf.net/p/openvpn/openvpn')
sha256sums=('SKIP')

pkgver() {
	cd openvpn/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd openvpn/

	# Build openvpn
	autoreconf -vi
	CFLAGS="${CFLAGS} -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
		--prefix=/usr \
		--enable-iproute2 \
		--enable-password-save \
		--enable-systemd \
		--mandir=/usr/share/man \
		--sbindir=/usr/bin
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
	find ${pkgdir}/usr/share/openvpn -type f -exec chmod 644 {} \;
	find ${pkgdir}/usr/share/openvpn -type d -exec chmod 755 {} \;

	# Install license
	install -d -m0755 ${pkgdir}/usr/share/licenses/openvpn
	ln -sf /usr/share/doc/${pkgname}/{COPYING,COPYRIGHT.GPL} ${pkgdir}/usr/share/licenses/openvpn

	# Install contrib
	install -d -m0755 ${pkgdir}/usr/share/openvpn/contrib
	cp -r contrib ${pkgdir}/usr/share/openvpn

	# Install systemd unit files
	install -D -m0644 distro/systemd/openvpn-client@.service ${pkgdir}/usr/lib/systemd/system/openvpn-client@.service
	install -D -m0644 distro/systemd/openvpn-server@.service ${pkgdir}/usr/lib/systemd/system/openvpn-server@.service
}

