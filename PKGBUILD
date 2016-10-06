# Maintainer: Shervin Khastoo <me@shervin.org>

pkgname=openvpn-xor-patched
pkgver=2.3.12
pkgrel=2
pkgdesc="OpenVPN obfuscated with xor-patch which can bypass internet censoring"
arch=(i686 x86_64)
url="https://github.com/clayface/openvpn_xorpatch"
depends=('openssl' 'lzo' 'lz4' 'pam' 'libsystemd')
optdepends=('easy-rsa: for easy key management')
conflicts=('openvpn' 'openvpn-dev')
provides=('openvpn=2.3.12' 'openvpn-dev')
license=('custom')
source=(https://github.com/OpenVPN/openvpn/archive/v${pkgver}.tar.gz openvpn@.service git://github.com/clayface/openvpn_xorpatch.git)
sha256sums=('698c50519fcb7dfa8880c760e3d9be9c3d145689c9eb243ac5d5c6fd19317bbc'
            '47a4ee993f8aaa7370e9a84384fcfc993fd76aa4db11c46629b156d0c5fad49a'
            'SKIP')

prepare() {
    cp openvpn_xorpatch/openvpn_xor.patch openvpn-2.3.12/
    
    cd openvpn-2.3.12/
    
    # Xor Patch
    patch -Np1 -i openvpn_xor.patch
}

build() {
	cd openvpn-2.3.12/

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
	cd openvpn-2.3.12/

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
	cd ..
	install -D -m0644 openvpn@.service ${pkgdir}/usr/lib/systemd/system/openvpn@.service
}

