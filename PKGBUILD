# Maintainer: Shervin Khastoo <me@shervin.org>

pkgname=openvpn-xor-patched
pkgver=2.3.11
pkgrel=1
pkgdesc="OpenVPN obfuscated with xor-patch which can bypass internet censoring"
arch=(i686 x86_64)
url="https://github.com/clayface/openvpn_xorpatch"
depends=('openssl' 'lzo' 'lz4' 'pam' 'libsystemd')
optdepends=('easy-rsa: for easy key management')
conflicts=('openvpn' 'openvpn-dev')
provides=('openvpn=2.3.11' 'openvpn-dev')
license=('custom')
source=(https://github.com/OpenVPN/openvpn/archive/v${pkgver}.tar.gz git://github.com/clayface/openvpn_xorpatch.git)
sha256sums=('ffab2e2fb50a4b65fc4b2d1ae972f52b2e5f91467af88349e2a5d27afd2d2846' 'SKIP')

prepare() {
    cp openvpn_xorpatch/openvpn_xor.patch openvpn-2.3.11/
    
    cd openvpn-2.3.11/
    
    # Xor Patch
    patch -Np1 -i openvpn_xor.patch
}

build() {
	cd openvpn-2.3.11/

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
	cd openvpn-2.3.11/

	# Install openvpn
	make DESTDIR=${pkgdir} install
	install -d -m0755 ${pkgdir}/etc/openvpn

	# Install examples
	install -d -m0755 ${pkgdir}/usr/share/openvpn
	cp -r sample/sample-config-files ${pkgdir}/usr/share/openvpn/examples
	find ${pkgdir}/usr/share/openvpn -type f -exec chmod 644 {} \;
	find ${pkgdir}/usr/share/openvpn -type d -exec chmod 755 {} \;

	# Install license
	install -d -m0755 ${pkgdir}/usr/share/licenses/${pkgname}
	ln -sf /usr/share/doc/openvpn/{COPYING,COPYRIGHT.GPL} ${pkgdir}/usr/share/licenses/${pkgname}/

	# Install contrib
	install -d -m0755 ${pkgdir}/usr/share/openvpn/contrib
	cp -r contrib ${pkgdir}/usr/share/openvpn

	# Install systemd unit files
	install -D -m0644 distro/systemd/openvpn-client@.service ${pkgdir}/usr/lib/systemd/system/openvpn-client@.service
	install -D -m0644 distro/systemd/openvpn-server@.service ${pkgdir}/usr/lib/systemd/system/openvpn-server@.service
}

